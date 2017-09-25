class Employee < ActiveRecord::Base
	validates_presence_of :first_name
	validates_uniqueness_of :first_name, :scope => :last_name

	has_many :schedules
end

