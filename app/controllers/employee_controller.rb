class EmployeeController < ApplicationController
  protect_from_forgery with: :exception

  before_action :get_employee, only:[:show, :edit, :update, :destroy]

  def get_employee
  	@employee = Employee.find(params[:id])
  end

  def index

  end

  def show

  end

  def new
  	
  end

  def create
    @employee = Employee.new(params.require(:employee).permit(:first_name,:last_name,:email,:phone))
    @employee.save

    redirect_to employee_path(@employee)
  end

  def edit

  end

  def update
  	#@employee = Employee.find(params[:id])
  	@employee.update_attributes(params.require(:employee).permit(:first_name,:last_name,:email,:phone))

  	redirect_to @employee
  end

  def destroy
  	@employee.destroy
  	flash[:success] = "Employee Deleted"

  	redirect_to employee_index_path
  end
end
