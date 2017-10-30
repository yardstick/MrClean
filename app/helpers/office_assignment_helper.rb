module OfficeAssignmentHelper
  def get_weekly_office_assignments(week, office)
    assignments = Assignment.where(week: week, office: office)

    return assignments
  end
end