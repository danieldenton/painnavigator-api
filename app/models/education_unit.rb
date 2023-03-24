# == Schema Information
#
# Table name: education_units
#
#  id                     :bigint           not null, primary key
#  module_order           :integer
#  module_type            :string
#  name                   :string
#  length                 :integer
#  post_video_destination :string
#  source                 :string
#  skippable              :boolean
#  summary                :string
#  steps                  :string
#  condensed_program      :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class EducationUnit < ApplicationRecord
end
