class DailyPainScoreSerializer
  include JSONAPI::Serializer
  attributes :id, :score, :date_time_value
end