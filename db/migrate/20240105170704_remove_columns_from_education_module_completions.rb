class RemoveColumnsFromEducationModuleCompletions < ActiveRecord::Migration[6.1]
  def change
    remove_column :education_module_completions, :date_time_value, :float
  end
end
