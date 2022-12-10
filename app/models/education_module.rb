class EducationModule < ApplicationRecord
  enum skippable: [:no, :yes]
end
