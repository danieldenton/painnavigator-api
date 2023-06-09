class DailyPainScore < ApplicationRecord
  belongs_to :user, touch: false
end