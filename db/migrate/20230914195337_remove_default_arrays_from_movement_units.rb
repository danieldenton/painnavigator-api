class RemoveDefaultArraysFromMovementUnits < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:users, :saved_movement_units, nil)
    change_column_default(:users, :skipped_movement_units, nil)
    change_column_default(:users, :completed_movement_units, nil)
  end
end
