class CreateSmartGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :smart_goals do |t|
      t.string :goal
      t.string :steps
      t.string :reward
      t.date :end_date
      t.integer :user_id
      t.integer :status, default: 0
      t.float :date_time_value
      t.integer :smart_goal_updates_count

      t.timestamps
    end
  end
end
