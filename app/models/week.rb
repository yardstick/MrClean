class Week < ActiveRecord::Base
  validates :starts_at, presence: true, uniqueness: true

  has_many :assignments
  has_many :employees, through: :assignments

  scope :upcoming, -> { where('starts_at > ?', Time.zone.now.last_week.end_of_week) }
end