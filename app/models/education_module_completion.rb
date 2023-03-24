# == Schema Information
#
# Table name: education_module_completions
#
#  id              :bigint           not null, primary key
#  module_id       :integer
#  status          :integer
#  user_id         :integer
#  date_time_value :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class EducationModuleCompletion < ApplicationRecord
  belongs_to :user, counter_cache: :education_modules_count
  after_create :set_date_time
  enum status: [:completed, :skipped]

  def set_date_time
    self.date_time_value = self.created_at.to_f * 1000
  end

end
