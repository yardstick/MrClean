class UserMailer < ApplicationMailer
  def assignment_reminder(assignment)
    @employee = assignment.employee

    mail(to: @employee.email, subject: "Kitchen Duties Reminder")
  end
end
