class SmartGoalUpdate < ApplicationRecord
  belongs_to :smart_goal, counter_cache: true
  after_create :set_date_time

  def set_date_time
    self.date_time_value = self.created_at.to_f * 1000
  end

  def date_time_value
    self.date_time_value = self.created_at.to_f * 1000
  end
end
