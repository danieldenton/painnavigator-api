class SmartGoal < ApplicationRecord
  belongs_to :user
  has_many  :smart_goal_updates, dependent: :destroy
  enum status: [:active, :finished]
  after_create :set_date_time

  def set_date_time
    self.date_time_value = self.created_at.to_f * 1000
  end

  def date_time_value
    self.created_at.to_f * 1000
  end
end
