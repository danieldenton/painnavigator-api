class AddSavedToMovementModuleCompletions < ActiveRecord::Migration[6.1]
  def change
    add_column :movement_module_completions, :saved, :boolean, default: false
  end
end
