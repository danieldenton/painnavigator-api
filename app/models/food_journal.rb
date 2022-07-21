class FoodJournal < ApplicationRecord
  belongs_to :user
  #after_create :set_date_time
  after_validation -> { self.date_time_value = Time.now }, on: :create

  #def set_date_time
    #self.date_time_value = self.created_at.to_f * 1000
  #end
end
