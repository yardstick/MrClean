class AssignmentSwapController < ApplicationController

  def index
    @weeks = current_office.weeks.upcoming 
  end

  def create
    SwapsAssignments.new.call(params[:assignments][:assignment_id]) unless less_than_two_assignments_selected?(params)

    redirect_to(action: "index")
  end

  private

    def less_than_two_assignments_selected?(params)
      if !(params.has_key?("assignments"))
        return true
      elsif params[:assignments][:assignment_id].count != 2
        return true
      else
        return false
      end
    end

end