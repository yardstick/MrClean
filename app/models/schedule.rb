class Schedule < ActiveRecord::Base
	validates_presence_of :start_year, :start_month, :start_day

	validates_uniqueness_of :start_day, :scope => [:start_year, :start_month, :start_day]

	belongs_to :employee1, :class_name => "Employee"
	belongs_to :employee2, :class_name => "Employee"
end