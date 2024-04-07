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
class MovementModuleCompletionSerializer
  include JSONAPI::Serializer
  attributes :id, :status, :module_id, :video_id, :saved, :created_at, :updated_at
end
