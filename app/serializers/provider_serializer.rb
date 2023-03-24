# == Schema Information
#
# Table name: providers
#
#  id                :bigint           not null, primary key
#  name              :string
#  code              :string
#  users_count       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  condensed_program :boolean          default(FALSE)
#
class ProviderSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :code, :condensed_program, :users_count
end
