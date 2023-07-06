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
class SmartGoalUpdateSerializer
  include JSONAPI::Serializer
  belongs_to :smart_goal
  attributes :id, :smart_goal_id, :goal_update, :date_time_value, :date_time_value
end
