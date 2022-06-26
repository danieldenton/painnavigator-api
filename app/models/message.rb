class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  after_create :set_date_time

  enum status: [:unread, :read]

  def set_date_time
    self.date_time_value = self.created_at.to_f * 1000
  end
end
