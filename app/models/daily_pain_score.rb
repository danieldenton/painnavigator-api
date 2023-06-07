class DailyPainScore < ApplicationRecord
  belongs_to :user

  validates :score, presence: true, numericality: { only_integer: true }
end