class Trip < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validate :validate_start_and_end_dates

  def validate_start_and_end_dates
    errors.add(:start_date, "Date cannot be in the past") if start_date.present? && start_date < Time.current
    errors.add(:end_date, "Date cannot be in the past") if end_date.present? && end_date < Time.current
  end
end
