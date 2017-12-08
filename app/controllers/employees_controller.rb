class EmployeesController < SecureController
  helper :employee

  protect_from_forgery with: :exception

  before_action :get_employee, only:[:show, :edit, :update, :destroy]
  before_action :get_offices, only:[:new,:edit]

  def index
    @employees = Employee.where(office: current_office).order(:first_name)
  end

  def new
    @employee = Employee.new(office: current_office)
  end

  def create
    @employee = Employee.new(employee_params(params))

    @current_office = @employee.office

    if @employee.save  
      redirect_to office_employee_path(@current_office, @employee)
    else
      render(:new)
    end
  end

  def update
    @old_office = @employee.office

    @employee.update_attributes(employee_params(params))

    @current_office = @employee.office

    #destroys upcoming assignments if the employee's office is changed
    if @old_office != @current_office
      assignments = Assignment.upcoming.where(employee: @employee)

      assignments.each do |assignment|
        assignment.destroy
      end
    end

    if @employee.save  
      redirect_to office_employee_path(@current_office, @employee)
    else
      render(:new)
    end
  end

  def destroy
    assignments = Assignment.upcoming.where( employee_id: @employee.id)
    #gets all assignments including and beyond the current week which will be deleted

    assignments.each do |assignment|
      assignment.destroy
    end

    @current_office = @employee.office  
    @employee.destroy
    flash[:success] = "Employee Deleted"

    redirect_to office_employees_path(@current_office)
  end

  private

    def employee_params(params)
      params.require(:employee).permit(:first_name, :last_name, :email, :office_id)
    end 

    def get_employee
      @employee = Employee.find(params[:id])
    end
end
