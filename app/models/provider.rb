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
class Provider < ApplicationRecord
  has_many  :users, class_name: "User", foreign_key: "provider_id", dependent: :nullify
end
