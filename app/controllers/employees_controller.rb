class EmployeesController < ApplicationController
  helper :employee

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :get_employee, only:[:show, :edit, :update, :destroy]

  def get_employee
    @employee = Employee.find(params[:id])
  end

  def index
    @employees = Employee.order(:first_name)  
  end

  def new
    @employee = Employee.new
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
      params.require(:employee).permit(:first_name, :last_name, :email, :phone)
    end 
end
