class UserMailer < ApplicationMailer
  default from: "MrClean@mrclean.ca"

  def assignment_reminder(employee)
    @employee = employee

    mail(to: 'smtp://localhost.1025', subject: "Test email")
  end
end
