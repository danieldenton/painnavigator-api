class ProviderSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :code, :condensed_program, :users_count
end