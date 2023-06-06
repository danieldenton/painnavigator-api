class DailyPainScoreSerializer < ActiveModel::Serializer
  attributes :id, :scores, :created_at, :updated_at
  
  belongs_to :user
end

