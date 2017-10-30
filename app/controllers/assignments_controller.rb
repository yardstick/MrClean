class AssignmentsController < SecureController
  helper :timestamp, :employee, :office_assignment

  include EmployeeHelper

  protect_from_forgery with: :exception

  skip_before_action :authenticate_user!, only:[:index]
  before_action :get_office
  before_action :load_employees, only:[:edit, :new]

  def index
    @weeks = Week.upcoming
  end

  def new
    @week = Week.find(params[:week])

    if Assignment.where(week: @week).count >= 2
      redirect_to edit_assignment_path(@week)
    end

    @assignment = Assignment.new
  end

  def create
    assignment = Assignment.create(assignment_params(params))

    week = Week.find(params[:assignment][:week_id])
    redirect_to edit_assignment_path(week)
  end

  def edit
    @week = Week.find(params[:id])
    @office = Office.find(params[:office_id])
    @assignments = Assignment.where(week: @week, office: @office)
  end

  def update
    @assignment = Assignment.find(params[:id])

    @assignment.update_attributes(assignment_params(params))

    redirect_to assignments_path
  end

  private

    def assignment_params(params)
      params.require(:assignment).permit(:employee_id,:week_id)
    end

    def load_employees
      @employees = Employee.all
    end

    def get_office
      if params[:office_id].present?
        @office = Office.find(params[:office_id])
      else
        @office = Office.first
    end
    end

end
