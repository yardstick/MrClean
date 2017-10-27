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
      @last_assignment_list = Employee.find_each.map do |employee|
        last_employee_assignment(employee)
      end

      @last_assignment_list = @last_assignment_list.sort_by {|assignment| [assignment.week.created_at, assignment.id , assignment.employee.id]}
    end

    def last_employee_assignment(employee)
      Assignment.where(employee: employee).order(:week_id, :id).last ||
        Assignment.new(week: @week, employee: employee, created_at: Time.zone.now)
    end

    def create_week_assignment
      employee = @last_assignment_list.first.employee

      Assignment.create(week: @week, employee: employee)

      @last_assignment_list.shift
    end
end
