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
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
