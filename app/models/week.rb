class Week < ActiveRecord::Base

  validates :starts_at, presence: true, uniqueness: {scope: [:office]}

  has_many :assignments
  has_many :employees, through: :assignments

  belongs_to :office

  scope :upcoming, -> { where('starts_at > ?', Time.zone.now.last_week.end_of_week) }

  def fully_assigned?
    assignments.count >= office.num_assignments_per_week
  end

end

