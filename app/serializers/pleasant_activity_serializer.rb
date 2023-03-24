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
class PleasantActivitySerializer
  include JSONAPI::Serializer
  attributes :id, :activities
end
