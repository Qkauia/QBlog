module ApplicationHelper
  def format_datetime(date_time)
    date_time&.strftime('%Y/%m/%d %H:%M')
  end
end
