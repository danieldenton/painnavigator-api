class EducationModule < ApplicationRecord
  enum module_type: [:video, :text, :audio]
  enum skippable: [:no, :yes]
end
