class CreateSmartGoalUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :smart_goal_updates do |t|
      t.integer :smart_goal_id
      t.string :goal_update
      t.float :date_time_value

      t.timestamps
    end
  end
end
