class SendsAssignmentReminders
  def call
    Office.find_each do |office|
      @week = office.weeks.upcoming.second

      Assignment.where(week: @week).find_each do |assignment|
        UserMailer.assignment_reminder(assignment).deliver
      end
    end
  end
end
