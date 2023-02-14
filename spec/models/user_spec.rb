require 'rails_helper'

# Test suite for the user model
RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:trips) }
  end

  describe 'Validations' do
    context 'with basic validations' do
      subject { build(:user) }

      it { is_expected.not_to allow_value('invalid_email').for(:email) }
    end
  end
end

