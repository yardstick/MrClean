class ScheduleController < ApplicationController
  helper_method :printDate

  protect_from_forgery with: :exception


		def show

		end

		def index

		end

	private
		def printDate(schedule)
			months = {1 => "January",2=>"February",3=>"March",4=>"April",5=>"May",6=>"June",7=>"July",8=>"August",9 => "September",10=>"October",11=>"November",12=>"December"}

			return "#{months[schedule.start_month]} #{schedule.start_day}, #{schedule.start_year}"
		end
end
