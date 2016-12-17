class GoogleCalendarController < ApplicationController
  def index
    CalendarMailer.calendar_email(current_user).deliver_now
    @calendar = GoogleCalendarWrapper.new(current_user)
    @list = @calendar.get_calendar_list
    @calendars = JSON.parse @list.response.env.body
    events = @calendar.get_calendar_event(@calendars['items'][10]['id'])
    @event_list = JSON.parse events.response.env.body
# binding.pry
  end
end
