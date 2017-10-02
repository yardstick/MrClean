class WeekController < ApplicationController
  protect_from_forgery with: :exception

  include AssignmentGenerationHelper

  def new
    last_week = Week.order(:starts_at).last #the last week added to the db

    new_week = last_week.starts_at.next_week.beginning_of_week

    week = Week.create(starts_at: new_week)

    generate_new_week_assignments(week)

    redirect_to assignment_index_path
  end

end