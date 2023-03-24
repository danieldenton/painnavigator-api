# == Schema Information
#
# Table name: food_journals
#
#  id              :bigint           not null, primary key
#  user_id         :integer
#  breakfast       :string
#  lunch           :string
#  dinner          :string
#  snacks          :string
#  date_time_value :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  created         :string
#
class FoodJournalSerializer
  include JSONAPI::Serializer
  attributes :id, :date_time_value, :breakfast, :lunch, :dinner, :snacks, :created
end
