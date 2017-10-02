class AssignmentController < ApplicationController
  helper :timestamp, :employee
  helper_method :employee_to_str


  protect_from_forgery with: :exception

  def index
    @weeks = Week.upcoming
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

end
