namespace :mail_tasks do
  desc "rake task for heroku schedule to send out the weekly notifications."
  task send_weekly_notifications: :environment do
    # Heroku scheduler only allows for daily tasks so we conditionally send
    SendsAssignmentReminders.new.call if Time.now.sunday?
  end
end
