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
class SmartGoalSerializer
  include JSONAPI::Serializer
  #has_many :smart_goal_updates
  attributes :id, :goal, :steps, :reward, :end_date, :date_time_value, :status, :goal_updates, :meaning, :challenges
end
