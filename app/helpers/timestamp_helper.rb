module TimestampHelper
  def print_date(week)
    @start = week.starts_at
    @end   = week.starts_at.end_of_week(start_day = :saturday)

    if @start.month == @end.month
      return "#{@start.strftime('%b %-d')} - #{@end.strftime('%-d')}"
    elsif @start.year == @end.year
      return "#{@start.strftime('%b %-d')} - #{@end.strftime('%b %-d')}"
    else
      return "#{@start.strftime('%b %-d, %y')} - #{@end.strftime('%b %-d, %y')}"
    end
  end
end