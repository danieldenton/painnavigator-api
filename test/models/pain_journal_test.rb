# == Schema Information
#
# Table name: pain_journals
#
#  id                :bigint           not null, primary key
#  intensity         :integer
#  situation         :string
#  feeling           :string
#  who_i_was_with    :string
#  coping_strategies :string
#  notes             :string
#  intensity_after   :integer
#  user_id           :integer
#  date_time_value   :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  created           :string
#  time_stamp        :integer
#
require "test_helper"

class PainJournalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
