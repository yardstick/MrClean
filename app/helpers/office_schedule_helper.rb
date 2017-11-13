module OfficeScheduleHelper
  def get_weekly_office_assignments(week, office)
    Assignment.where(week: week, office: office)
  end
end