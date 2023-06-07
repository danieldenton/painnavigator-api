class DailyPainScoreSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  attributes :id, :score, :created_at, :updated_at

  belongs_to :user
end
=======
  attributes :id, :scores, :created_at, :updated_at
  
  belongs_to :user
end

>>>>>>> parent of ef565bc (all daily_pain_score removed)
