class RenameSavedMovementModulesToSavedMovementUnits < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :saved_movement_modules, :saved_movement_units
  end
end
