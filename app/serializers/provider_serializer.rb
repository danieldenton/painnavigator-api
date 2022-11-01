class ProviderSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :code, :users_count
end