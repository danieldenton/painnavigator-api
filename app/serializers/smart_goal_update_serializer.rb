class SmartGoalUpdateSerializer
  include JSONAPI::Serializer
  belongs_to :smart_goals
  attributes :id, :smart_goal_id, :goal_update, :date_time_value, :date_time_value
end