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
        Assignment.new(week: Week.new(starts_at: employee.created_at, office: @current_office), employee: employee, created_at: employee.created_at)
    end

    def create_week_assignment
      if @last_assignment_list.count >= 1
        employee = @last_assignment_list.first.employee

        Assignment.create(week: @week, employee: employee)

        @last_assignment_list.shift
      end
    end
end
