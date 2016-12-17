class GoogleCalendarWrapper

  def initialize(current_user)
    configure_client(current_user)
  end

  def configure_client(current_user)
    @client = Google::APIClient.new
    @client.authorization.access_token = current_user.token
    # @client.authorization.refresh_token = current_user.refresh_token
    @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    # @client.authorization.refresh!
    @service = @client.discovered_api('calendar', 'v3')
  end

  def get_calendar_list
    @client.execute(api_method: @service.calendar_list.list)
  end

  def get_calendar_event(cal_id)
    response = @client.execute(api_method: @service.events.list,
                               parameters: { 'calendarId' => cal_id,
                                             timeMin: Date.today.rfc3339,
                                             timeMax: (Date.today + 7.days).rfc3339 },
                               headers: { 'Content-Type' => 'application/json' })
  end
end