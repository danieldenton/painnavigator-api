class ProviderSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :code, :user_count
end