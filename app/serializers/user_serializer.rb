class UserSerializer
  include JSONAPI::Serializer
  attributes :profile, :onboard_status, :profile_status, :education_progress, :movement_progress, :conversation, :last_pain_journal_date, :last_mood_journal_date, :last_food_journal_date, :mood_journals, :pain_journals, :pain_graph_data, :food_journals, :smart_goals

  #has_many  :bookmarks
  #has_many  :education_modules
  #has_many  :food_journals
  #has_many  :mood_journals
  #has_many  :movement_modules
  #has_many  :pain_journals
  #has_many  :smart_goals
end