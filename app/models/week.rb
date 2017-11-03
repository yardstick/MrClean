class Week < ActiveRecord::Base

  ASSIGNMENTS_PER_WEEK = 2

  validates :starts_at, presence: true, uniqueness: true

  has_many :assignments
  has_many :employees, through: :assignments

  scope :upcoming, -> { where('starts_at > ?', Time.zone.now.last_week.end_of_week) }

  def fully_assigned?
    assignments.count >= ASSIGNMENTS_PER_WEEK
  end

end

