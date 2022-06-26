class CreatePleasantActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :pleasant_activities do |t|
      t.string :activities
      t.integer :user_id

      t.timestamps
    end
  end
end
