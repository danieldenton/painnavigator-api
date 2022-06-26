class CreateFoodJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :food_journals do |t|
      t.integer :user_id
      t.string :breakfast
      t.string :lunch
      t.string :dinner
      t.string :snacks
      t.float :date_time_value

      t.timestamps
    end
  end
end
