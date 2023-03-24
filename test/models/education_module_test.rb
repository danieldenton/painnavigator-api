# == Schema Information
#
# Table name: education_modules
#
#  id                          :bigint           not null, primary key
#  module_id                   :integer
#  module_type                 :integer
#  name                        :string
#  length                      :integer
#  post_completion_destination :string
#  source                      :string
#  skippable                   :integer
#  summary                     :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
require "test_helper"

class EducationModuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
