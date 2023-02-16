require 'rails_helper'

# RSpec.configure do |config|
#   config.include ActiveSupport::Testing::TimeHelpers
# end

RSpec.describe GetWeatherConditionService, type: :service do
  let!(:trip) { create(:trip) }
  describe 'Get Weather Condition', :vcr do
    let(:weather_response) do
      VCR.use_cassette("trip/weather_condition") { described_class.new(trip).get_weather }
    end
    it { expect(weather_response).to be_kind_of(Array) }
    it { expect(weather_response.first).to have_key('description') }
    it { expect(weather_response.first).to have_key('date') }
  end
end 
