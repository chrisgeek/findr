class TripMailer < ApplicationMailer
  default from: 'no-reply@test.com'

  def send_trip_notification_mail(trip)
    @trip = trip
    @user = @trip.user
    mail to: @user.email, subject: 'Weather Condition Update'
  end
end
