class RemoveDefaultArraysFromMovementUnits < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:saved_movement_units, nil)
    change_column_default(:skipped_movement_units, nil)
    change_column_default(:completed_movement_units, nil)
  end
end
