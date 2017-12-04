class GenerateNewWeekAssignments
  def initialize(week,current_office)
    @week = week
    @current_office = current_office
  end

  def call
    generate_last_assignment_list

    2.times do
      create_week_assignment
    end
  end

  private

    def generate_last_assignment_list
      @last_assignment_list = @current_office.employees.map do |employee|
        last_employee_assignment(employee)
      end

      @last_assignment_list = @last_assignment_list.sort_by {|assignment| [assignment.week.starts_at, assignment.id , assignment.employee.id]}
    end

    def last_employee_assignment(employee)
      Assignment.where(employee: employee).order(:week_id, :id).last ||
        Assignment.new(week: Week.new(starts_at: employee.created_at-1.week, office: @current_office), employee: employee, created_at: employee.created_at)
    end

    def create_week_assignment
      count = @last_assignment_list.count

      if count >= 2
        assignment_saved = false

        while !assignment_saved 
          arr_index = exponential_distribution(count)

          employee = @last_assignment_list[arr_index].employee

          new_assignment = Assignment.new(week: @week, employee: employee)

          assignment_saved = new_assignment.save
        end
      elsif count == 1
        employee = @last_assignment_list.first.employee

        Assignment.create(week: @week, employee: employee) 
      end
    end

    #returns a random integer between 0-max heavily weighted towards 0
    def exponential_distribution(max)
      ((-Math.log(rand)/0.9).ceil - 1) % max
    end
end
