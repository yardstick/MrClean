class UserMailer < ApplicationMailer
  def assignment_reminder(employee)
    @employee = employee

    mail(to: @employee.email, subject: "Kitchen Duties Reminder")
  end
end
