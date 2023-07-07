# == Schema Information
#
# Table name: education_module_completions
#
#  id              :bigint           not null, primary key
#  module_id       :integer
#  status          :integer
#  user_id         :integer
#  date_time_value :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class EducationModuleCompletionSerializer
  include JSONAPI::Serializer
  attributes :id, :date_time_value, :status, :module_id, :education_progress
end
