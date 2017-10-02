module EmployeeHelper
  def employee_full_name(employee)
    return "#{employee.first_name} #{employee.last_name}"
  end
end