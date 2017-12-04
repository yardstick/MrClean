class AssignmentSwapController < ApplicationController

  def index
    @weeks = current_office.weeks.upcoming 
  end

  def create
    swap_assignments(params[:assignments][:assignment_id]) unless less_than_two_assignments_selected?(params)

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

    def swap_assignments(assignment_ids)
      assignment1 = Assignment.find(assignment_ids.first)
      assignment2 = Assignment.find(assignment_ids.second)

      employee1 = assignment1.employee
      employee2 = assignment2.employee

      Assignment.transaction do
        assignment1.update!(employee: employee2)
        assignment2.update!(employee: employee1)
      end
    end
end