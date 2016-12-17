class GoogleCalendarController < ApplicationController
  def index
    @calendar = GoogleCalendarWrapper.new(current_user)
    @list = @calendar.get_calendar_list
  end
end
