class SendsAssignmentReminders
  def initialize
    @week = Week.upcoming.first
  end

  def call
    Assignment.where(week_id: @week.id).find_each do |assignment|
      UserMailer.assignment_reminder(assignment).deliver
    end
  end
end