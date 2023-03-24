# == Schema Information
#
# Table name: smart_goals
#
#  id                       :bigint           not null, primary key
#  goal                     :string
#  steps                    :string
#  reward                   :string
#  end_date                 :date
#  user_id                  :integer
#  status                   :integer          default("active")
#  date_time_value          :float
#  smart_goal_updates_count :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  meaning                  :string
#  challenges               :string
#
require "test_helper"

class SmartGoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
