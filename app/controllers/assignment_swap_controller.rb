class AssignmentSwapController < SecureController

  skip_before_action :authenticate_user!

  def index
    @weeks = current_office.weeks.upcoming 
  end

  def create
    #no assignments were selected
    if !(params.has_key?("assignment"))
      redirect_to office_assignment_swap_index_path
      return
    end

    # only 1 or more than 2 assignments were selected
    if params[:assignments][:assignment_id].count != 2
      redirect_to office_assignment_swap_index_path
      return
    end

    ass1 = Assignment.find(params[:assignments][:assignment_id].first)
    ass2 = Assignment.find(params[:assignments][:assignment_id].second)

    employee1 = ass1.employee
    employee2 = ass2.employee

    ass1.update(employee: employee2)
    ass2.update(employee: employee1)

    redirect_to office_assignment_swap_index_path
  end

end