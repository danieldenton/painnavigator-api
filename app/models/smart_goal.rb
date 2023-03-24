# == Schema Information
#
# Table name: smart_goals
#
#  id                       :bigint           not null, primary key
#  goal                     :string
#  steps                    :string
#  reward                   :string
#  end_date                 :date
#  user_id                  :integer
#  status                   :integer          default("active")
#  date_time_value          :float
#  smart_goal_updates_count :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  meaning                  :string
#  challenges               :string
#
class SmartGoal < ApplicationRecord
  belongs_to :user
  has_many :smart_goal_updates, dependent: :destroy
  enum status: [:active, :finished]
  after_create :set_date_time

  def set_date_time
    self.date_time_value = self.created_at.to_f * 1000
  end

  def date_time_value
    self.created_at.to_f * 1000
  end

  def goal_updates
    self.smart_goal_updates.order(:created_at).reverse
  end
  
end
