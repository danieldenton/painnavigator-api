# == Schema Information
#
# Table name: mood_journals
#
#  id                    :bigint           not null, primary key
#  user_id               :integer
#  feeling               :string
#  intensity             :integer
#  situation             :string
#  who_i_was_with        :string
#  primary_thought       :string
#  cognitive_distortions :string
#  date_time_value       :float
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  created               :string
#
class MoodJournal < ApplicationRecord
  belongs_to :user
end
