# == Schema Information
#
# Table name: smart_goal_updates
#
#  id              :bigint           not null, primary key
#  smart_goal_id   :integer
#  goal_update     :string
#  date_time_value :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class SmartGoalUpdateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
