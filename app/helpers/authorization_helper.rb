module AuthorizationHelper

  def can_index_employees?
    user_signed_in?
  end

  def can_edit_weeks?
    user_signed_in?
  end

  def can_create_weeks?
    user_signed_in?
  end

end