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
  attributes :profile, :completed_program, :expo_push_token, :app_version, :app_update_required, :movement_program, :education_program, :wellness_coach_reminder, :wellness_coach_reminded, :last_date_on_app, :dates_on_app, :education_progress, :movement_progress, :movement_units

  #has_many  :bookmarks
  #has_many  :education_modules
  #has_many  :food_journals
  #has_many  :mood_journals
  #has_many  :movement_modules
  #has_many  :pain_journals
  #has_many  :smart_goals
end
