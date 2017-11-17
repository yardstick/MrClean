class Office < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :employees
  has_many :weeks
  has_many :assignments, through: :weeks
end