FactoryBot.define do
  factory :trip do
    name { 'Vacation in Paris' }
    description { 'Lorem Ipsum' }
    start_date { 2.day.from_now }
    end_date { 4.days.from_now }
    city { 'Paris' }
    country { 'France' }
    association :user
  end
end
