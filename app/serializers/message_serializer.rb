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
class MessageSerializer
  include JSONAPI::Serializer
  attributes :id, :body, :date_time_value, :recipient_id, :sender_id, :status
end
