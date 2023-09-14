class RemoveDefaultArraysFromMovementUnits < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:user, :saved_movement_units, nil)
    change_column_default(:user, :skipped_movement_units, nil)
    change_column_default(:user, :completed_movement_units, nil)
  end
end
