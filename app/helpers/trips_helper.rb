module TripsHelper
  def display_weather_conditions(weather)
    weather.each do |w|
      "#{w['date']} - #{w['description']}"
    end
  end
end
