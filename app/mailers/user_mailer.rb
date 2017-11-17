class UserMailer < ApplicationMailer
  def assignment_reminder(assignment)
    @employee = assignment.employee
    @current_office = @employee.office

    mail(to: @employee.email, subject: "Kitchen Duties Reminder")
  end
end
