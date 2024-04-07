class AddSavedToEducationModuleCompletions < ActiveRecord::Migration[6.1]
  def change
    add_column :education_module_completions,  :saved, :boolean, default: false
  end
end
