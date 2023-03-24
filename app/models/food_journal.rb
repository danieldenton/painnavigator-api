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
class FoodJournal < ApplicationRecord
  belongs_to :user
  #after_create :set_date_time
  after_validation -> { self.date_time_value = Time.now.to_f * 1000 }, on: :create

  def set_date_time
    self.date_time_value = self.created_at.to_f * 1000
  end
end
