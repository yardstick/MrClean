namespace :mail_tasks do
  
  desc "rake task for heroku schedule to send out the weekly notifications."
  
  task send_weekly_notifications: :environment do   #Heroku schedule only allows for every day task not every week so this ensures its only sent of monday
    SendsAssignmentReminders.new.call if Time.now.sunday?
  end

end
