namespace :weather_notification do
  desc 'retrieve latest weather condtions'
  task trip: :environment do
    Trip.twenty_four_hours_from_now.each do |trip|
      get_weather_condition_service = GetWeatherConditionService.new(trip)
      trip.update(weather_condition: get_weather_condition_service.get_weather)
      TripMailer.send_trip_notification_mail(trip).deliver
    end unless Trip.twenty_four_hours_from_now.nil?
  end
end
