class AssignmentsController < SecureController
  helper :timestamp, :employee, :office_schedule

  include EmployeeHelper

  protect_from_forgery with: :exception

  skip_before_action :authenticate_user!, only:[:index]
  before_action :get_current_office, only: [:index, :new, :edit]
  before_action :load_employees, only:[:edit, :new]

  def index
    @weeks = @current_office.weeks.upcoming
  end

  def new
    @week = Week.find(params[:week])

    if @week.fully_assigned?
      redirect_to edit_office_assignment_path(@current_office, @week)
    end

    @assignment = Assignment.new
  end

  def create
    assignment = Assignment.create(assignment_params(params))

    redirect_to edit_office_assignment_path(assignment.week.office, assignment.week)
  end

  def edit
    @week = Week.find(params[:id])
    @assignments = Assignment.where(week: @week)
  end

  def update
    @assignment = Assignment.find(params[:id])

    @assignment.update_attributes(assignment_params(params))

    redirect_to office_assignments_path(@assignment.week.office)
  end

  private

    def assignment_params(params)
      params.require(:assignment).permit(:employee_id,:week_id);
    end

    def load_employees
      @employees = @current_office.employees.order(:first_name)
    end
end
