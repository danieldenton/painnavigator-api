# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  role                    :integer          default("standard")
#  uid                     :string
#  first_name              :string
#  last_name               :string
#  gender                  :integer
#  commitment              :integer
#  onboard_status          :integer          default(0)
#  profile_status          :integer          default(0)
#  phone                   :string
#  starting_pain_duration  :integer
#  activity_level          :integer
#  pace                    :integer
#  starting_pain_score     :integer
#  enjoyment_of_life       :integer
#  activity_interference   :integer
#  hopes_to_achieve        :string
#  dob                     :string
#  email                   :string
#  mood_journals_count     :integer
#  food_journals_count     :integer
#  education_modules_count :integer
#  movement_modules_count  :integer
#  bookmarks_count         :integer
#  smart_goals_count       :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  provider_id             :integer
#  wellness_coach_id       :integer
#  has_unreplied_message   :boolean          default(FALSE)
#  completed_program       :boolean          default(FALSE)
#
class UserSerializer
  include JSONAPI::Serializer
  attributes :profile, :onboard, :outcome, :education_progress, :movement_progress, :conversation, :last_pain_journal_date, :last_mood_journal_date, :last_food_journal_date, :mood_journals, :pain_journals, :pain_graph_data, :food_journals, :smart_goals, :active_goal_updates

  #has_many  :bookmarks
  #has_many  :education_modules
  #has_many  :food_journals
  #has_many  :mood_journals
  #has_many  :movement_modules
  #has_many  :pain_journals
  #has_many  :smart_goals
end
