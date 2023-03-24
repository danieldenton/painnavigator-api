# == Schema Information
#
# Table name: pleasant_activities
#
#  id         :bigint           not null, primary key
#  activities :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PleasantActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
