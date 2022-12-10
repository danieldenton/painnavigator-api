class EducationModuleCompletion < ApplicationRecord
  belongs_to :user, counter_cache: :education_modules_count
  after_create :set_date_time
  enum status: [:completed, :skipped]

  def set_date_time
    self.date_time_value = self.created_at.to_f * 1000
  end

  def next_two_units(module_id, condensed_program)
    if(condensed_program == true)
      units = EducationUnit.where(condensed_program: true).where("id > ?", module_id)
      first_unit = units.first
      second_unit = units.second
      return [first_unit, second_unit]
    else
      units = EducationUnit.where("id > ?", module_id)
      first_unit = units.first
      second_unit = units.second
      return [first_unit, second_unit]
    end
    
  end

end
