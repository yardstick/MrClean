class Office < ActiveRecord::Base
  validates :office_name, presence: true, uniqueness: true

  has_many :employees
  #has_many :assignments
end