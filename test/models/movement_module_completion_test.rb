# == Schema Information
#
# Table name: movement_module_completions
#
#  id              :bigint           not null, primary key
#  module_id       :integer
#  status          :integer
#  user_id         :integer
#  date_time_value :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class MovementModuleCompletionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
