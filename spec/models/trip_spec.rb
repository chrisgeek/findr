require 'rails_helper'

RSpec.describe Trip, type: :model do
  # Association test
  it { is_expected.to belong_to(:user) }

  # Validation tests
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:country) }
  it { is_expected.to validate_presence_of(:description) }

  describe '#validate start_and_end_dates' do
    let(:trip) { build(:trip, start_date: 2.days.ago, end_date: 1.day.from_now) }

    it 'validates created_at is not in the future' do
      expect(trip).not_to be_valid
    end
  end

  describe 'Scopes' do
    before do
      create(:trip, start_date: 1.day.from_now, end_date: 3.days.from_now)
      create(:trip, start_date: 1.day.from_now, end_date: 2.days.from_now)
    end

    it { expect(described_class.twenty_four_hours_from_now.count).to eq 2 }
  end
end
