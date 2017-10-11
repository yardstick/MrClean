class GenerateNewWeekAssignments
  def initialize(week)
    @week = week
  end

  def call
    generate_last_assignment_list

    2.times do
      create_week_assignment
    end
  end

  private

    def generate_last_assignment_list
      @last_assignment_list = []

      Employee.find_each do |employee|
        last_employee_assignment = Assignment.where(employee_id: employee.id).order(:week_id).last

        if last_employee_assignment.present?
          @last_assignment_list.push(last_employee_assignment)
        else
          temp_assignment = Assignment.create(week: @week, employee: employee)

          last_employee_assignment = Assignment.where(employee_id: employee.id).order(:week_id).last

          @last_assignment_list.push(last_employee_assignment)

          temp_assignment.destroy
        end
      end
    
      @last_assignment_list = @last_assignment_list.sort_by {|assignment| [assignment.week.created_at, assignment.employee.id]}

    end

    def create_week_assignment
      employee = @last_assignment_list.first.employee

      Assignment.create(week: @week, employee: employee)

      @last_assignment_list.shift
    end

end