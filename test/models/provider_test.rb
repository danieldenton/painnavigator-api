# == Schema Information
#
# Table name: providers
#
#  id                :bigint           not null, primary key
#  name              :string
#  code              :string
#  users_count       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  condensed_program :boolean          default(FALSE)
#
require "test_helper"

class ProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
