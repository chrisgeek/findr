class GetWeatherConditionService
  include HTTParty

  def initialize(trip)
    @city = trip.city
    @start_date = trip.start_date
    @end_date = trip.end_date
    @trip = trip
  end

  def get_weather
    @api_key = 'FW52JTL9PV69PS23HD89XSN6B'
    url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{@city}/#{@start_date}/#{@end_date}?key=#{@api_key}&include=days&elements=description"
    http_request = HTTParty.get(url, headers: { 'Content-Type' => 'application/json' })
    weather_conditions = http_request['days']
    dates = []
    (Date.strptime(@trip.start_date.to_s)..Date.strptime(@trip.end_date.to_s)).each { |d| dates << d }
    @trip.weather_condition = weather_conditions.each { |d| d }
    weather_conditions_h = {}
    i = 0
    while i < dates.count
      weather_conditions_h[dates[i]] = weather_conditions[i]['description']
      i = i + 1
    end
    weather_conditions_h
    # byebug
    # raise 'error'
  end
end
