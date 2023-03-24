# == Schema Information
#
# Table name: food_journals
#
#  id              :bigint           not null, primary key
#  user_id         :integer
#  breakfast       :string
#  lunch           :string
#  dinner          :string
#  snacks          :string
#  date_time_value :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  created         :string
#
require "test_helper"

class FoodJournalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
