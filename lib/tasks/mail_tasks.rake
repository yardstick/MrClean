namespace :mail_tasks do
  desc "rake task for heroku schedule to send out the weekly notifications."
  task send_weekly_notifications: :environment do
    if DateTime.now.wday == 1   #Heroku schedule only allows for every day task not every week so this ensures its only sent of monday
      week = Week.upcoming.first
      assignments = Assignment.where(week_id: week.id)

      assignments.each do |assignment|
        employee = assignment.employee

        UserMailer.assignment_reminder(employee).deliver
       end

    end
  end

end
