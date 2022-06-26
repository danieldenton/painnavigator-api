class MovementModuleCompletionSerializer
  include JSONAPI::Serializer
  attributes :id, :date_time_value, :status, :module_id
end