class AssignmentController < ApplicationController
  helper :timestamp, :employee

  include EmployeeHelper

  protect_from_forgery with: :exception

  before_action :create_employee_array, only:[:edit, :new]

  def index
    @weeks = Week.upcoming
  end

  def new
    @week = Week.find(params[:week])
  end

  def create
    assignment = Assignment.create(assignment_params(params))

    week = Week.find(params[:assignment][:week_id])
    redirect_to edit_assignment_path(week)
  end

  def edit
    @week = Week.find(params[:id])
    @assignments = Assignment.where(week: @week)
  end

  def update
    @assignment = Assignment.find(params[:id])

    @assignment.update_attributes(assignment_params(params))

    redirect_to assignment_index_path
  end

  private

    def assignment_params(params)
      params.require(:assignment).permit(:employee_id,:week_id)
    end

    def create_employee_array
      @employee_arr = Array.new 
      Employee.all.each do |employee|
        @employee_arr.push([employee_full_name(employee), employee.id])
      end
    end

end
