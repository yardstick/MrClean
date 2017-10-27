class SendsAssignmentReminders
  def initialize
    @week = Week.upcoming.first
  end

  def call
    Assignment.where(week: @week).find_each do |assignment|
      UserMailer.assignment_reminder(assignment).deliver
    end
  end
end
