class MessageSerializer
  include JSONAPI::Serializer
  attributes :id, :body, :date_time_value, :recipient_id, :sender_id, :status
end