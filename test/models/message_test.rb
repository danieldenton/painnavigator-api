# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  sender_id       :integer
#  recipient_id    :integer
#  body            :string
#  status          :integer          default("unread")
#  date_time_value :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
