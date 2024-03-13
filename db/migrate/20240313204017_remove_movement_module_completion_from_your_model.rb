class RemoveDateTimeValueFromMovementModuleCompletion < ActiveRecord::Migration[6.1]
  def change
    remove_column :movement_module_completions, :date_time_value
  end
end
