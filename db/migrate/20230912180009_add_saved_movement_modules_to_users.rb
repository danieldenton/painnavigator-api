class AddSavedMovementModulesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :saved_movement_modules, :integer, array: true, default: []
  end
end
