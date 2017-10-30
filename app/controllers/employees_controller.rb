class EmployeesController < SecureController
  helper :employee

  protect_from_forgery with: :exception

  before_action :get_employee, only:[:show, :edit, :update, :destroy]
  before_action :load_offices, only:[:new,:edit]

  def get_employee
    @employee = Employee.find(params[:id])
  end

  def index
    if params[:office_id].present?
      @office = Office.find(params[:office_id])
      @office_name = @office.office_name
      @employees = Employee.where(office: @office)
    else
      @employees = Employee.order(:first_name)
      @office_name = "All"
    end
  end

  def new
    @employee = Employee.new
    @office = Office.first
  end

  def create
    @employee = Employee.new(employee_params(params))
    @employee.save

    redirect_to employee_path(@employee)
  end

  def update
    @employee.update_attributes(employee_params(params))

    redirect_to @employee
  end

  def destroy
    assignments = Assignment.upcoming.where( employee_id: @employee.id)
    #gets all assignments including and beyond the current week which will be deleted

    assignments.each do |assignment|
      assignment.destroy
    end


    @employee.destroy
    flash[:success] = "Employee Deleted"

    redirect_to(action: :index)
  end

  private

    def employee_params(params)
      params.require(:employee).permit(:first_name, :last_name, :email, :phone, :office_id)
    end 

    def load_offices
      @offices = Office.all
    end
end
