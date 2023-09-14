class RemoveDefaultArraysFromMovementUnits < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:movement_units, :saved_movement_units, nil)
    change_column_default(:movement_units, :skipped_movement_units, nil)
    change_column_default(:movement_units, :completed_movement_units, nil)
  end
end
