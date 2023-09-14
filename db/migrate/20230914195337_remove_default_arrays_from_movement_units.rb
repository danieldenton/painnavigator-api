class RemoveDefaultArraysFromMovementUnits < ActiveRecord::Migration[6.1]
  def up
    change_column_default :users, :saved_movement_units, from: [], to: nil
    change_column_default :users, :skipped_movement_units, from: [], to: nil
    change_column_default :users, :completed_movement_units, from: [], to: nil
  end

  def down
    change_column_default :users, :saved_movement_units, from: nil, to: []
    change_column_default :users, :skipped_movement_units, from: nil, to: []
    change_column_default :users, :completed_movement_units, from: nil, to: []
  end
end

