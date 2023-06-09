class DailyPainScoreSerializer
  include JSONAPI::Serializer
  attributes :id, :score, :created_at
end