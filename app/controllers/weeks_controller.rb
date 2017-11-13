class WeeksController < SecureController
  protect_from_forgery with: :exception

  def new
    last_week = Week.where(office: current_office).order(:starts_at).last #the last week added to the db

    if last_week.present?
      new_week = last_week.starts_at.next_week.beginning_of_week
    else
      #should only be used when creating the first week in the db
      new_week = DateTime.now.beginning_of_week
    end

    week = Week.create(starts_at: new_week, office: current_office)

    GenerateNewWeekAssignments.new(week, current_office).call

    redirect_to office_assignments_path(current_office)
  end

end
