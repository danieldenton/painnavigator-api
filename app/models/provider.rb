class Provider < ApplicationRecord
  has_many  :users, class_name: "User", foreign_key: "provider_id", dependent: :nullify
end
