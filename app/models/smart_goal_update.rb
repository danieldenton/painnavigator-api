# == Schema Information
#
# Table name: smart_goal_updates
#
#  id              :bigint           not null, primary key
#  smart_goal_id   :integer
#  goal_update     :string
#  date_time_value :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
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
