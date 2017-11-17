class Assignment < ActiveRecord::Base
  validates_presence_of :week, :employee
  validates_uniqueness_of :employee, :scope => :week

  belongs_to :week
  belongs_to :employee
  
  scope :upcoming, -> { where('week_id >= ?', Week.upcoming.first.id) }

end

