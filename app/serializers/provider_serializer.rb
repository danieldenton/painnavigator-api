class ProviderSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :code
end