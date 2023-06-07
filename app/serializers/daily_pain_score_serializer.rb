class DailyPainScoreSerializer < ActiveModel::Serializer
  attributes :id, :score, :created_at, :updated_at

  belongs_to :user
end