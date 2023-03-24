# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  sender_id       :integer
#  recipient_id    :integer
#  body            :string
#  status          :integer          default("unread")
#  date_time_value :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Message < ApplicationRecord
  require "date"
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  after_create :set_date_time

  enum status: [:unread, :read]

  def set_date_time
    self.date_time_value = self.created_at.to_f * 1000
  end

  def timestamp
    return created_at.strftime("%A %b %e, %l:%M %P")
  end
end
