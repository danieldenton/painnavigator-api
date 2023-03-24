# == Schema Information
#
# Table name: pain_journals
#
#  id                :bigint           not null, primary key
#  intensity         :integer
#  situation         :string
#  feeling           :string
#  who_i_was_with    :string
#  coping_strategies :string
#  notes             :string
#  intensity_after   :integer
#  user_id           :integer
#  date_time_value   :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  created           :string
#  time_stamp        :integer
#
class PainJournalSerializer
  include JSONAPI::Serializer
  attributes :id, :created_at, :date_time_value, :intensity, :situation, :feeling, :who_i_was_with, :coping_strategies, :notes, :intensity_after, :created
end
