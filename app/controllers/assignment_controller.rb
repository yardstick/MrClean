class AssignmentController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @weeks = Week.all
    @assignments = Assignment.all
  end

end
