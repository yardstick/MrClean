class Assignment < ActiveRecord::Base
  validates_presence_of :week, :employee

  belongs_to :week
  belongs_to :employee
end
