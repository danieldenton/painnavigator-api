class AddSkippedAndCompletedMovementUnitsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :skipped_movement_units, :integer, array: true, default: []
    add_column :users, :completed_movement_units, :integer, array: true, default: []
  end
end
