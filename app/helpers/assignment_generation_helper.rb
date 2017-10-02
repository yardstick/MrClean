module AssignmentGenerationHelper
  def generate_new_week_assignments(week)
    last_assigned = []

    Employee.all.each do |employee|
      last_employee_assignment = Assignment.where(employee_id: employee.id).order(:week_id).last

      if last_employee_assignment.present?
        last_assigned.push(last_employee_assignment)
      else
        #new employee who haven't been assigned yet dealt with here
      end
    end
    
    last_assigned = last_assigned.sort_by {|assignment| [assignment.week, assignment.employee]}

    employee = last_assigned.first.employee

    Assignment.create(week: week, employee: employee)

    last_assigned.shift

    employee = last_assigned.first.employee

    Assignment.create(week: week, employee: employee)
  end
end