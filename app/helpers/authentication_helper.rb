module AuthenticationHelper

  def is_logged_in
    return user_signed_in?
  end

  def can_access_employee_information_page
    return user_signed_in?
  end

  def can_edit_weeks
    return user_signed_in?
  end

  def can_add_weeks
    return user_signed_in?
  end

end