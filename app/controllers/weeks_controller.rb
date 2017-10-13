class WeeksController < ApplicationController
  protect_from_forgery with: :exception

  def new
    last_week = Week.order(:starts_at).last #the last week added to the db

    if last_week.present?
      new_week = last_week.starts_at.next_week.beginning_of_week
    else
      #should only be used when creating the first week in the db
      new_week = DateTime.now.beginning_of_week
    end

    week = Week.create(starts_at: new_week)

    GenerateNewWeekAssignments.new(week).call

    redirect_to assignments_path
  end

end
