class Week < ActiveRecord::Base
  validates_presence_of :starts_at
  validates_uniqueness_of :starts_at

  has_many :assignments
end