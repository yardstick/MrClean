class Employee < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

  belongs_to :office
  has_many :assignments
end

