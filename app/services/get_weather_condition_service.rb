class GetWeatherConditionService
  include HTTParty

  def initialize(trip)
    @city = trip.city
    @start_date = trip.start_date
    @end_date = trip.end_date
    @trip = trip
  end

  def get_weather
    http_request = HTTParty.get(url_path, headers: { 'Content-Type' => 'application/json' })
    weather_conditions = http_request['days']
    dates = []
    (Date.strptime(@trip.start_date.to_s)..Date.strptime(@trip.end_date.to_s)).each { |d| dates << d }
    weather_condtions_and_dates(dates, weather_conditions)
    # byebug
  end

  def url_path
    @api_key = 'FW52JTL9PV69PS23HD89XSN6B'
    "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{@city}/#{@start_date}/#{@end_date}?key=#{@api_key}&include=days&elements=description"
  end

  def weather_condtions_and_dates(dates, weather_conditions)
    weather_conditions.each_with_index do |w, i|
      w['date'] = dates[i]
    end
  end
end
