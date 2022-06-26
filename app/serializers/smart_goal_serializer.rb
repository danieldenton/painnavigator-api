class SmartGoalSerializer
  include JSONAPI::Serializer
  #has_many :smart_goal_updates
  attributes :id, :goal, :steps, :reward, :end_date, :date_time_value, :status, :smart_goal_updates
end