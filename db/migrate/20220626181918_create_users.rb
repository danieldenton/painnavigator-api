class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :role, default: 0
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.integer :commitment
      t.integer :onboard_status, default: 0
      t.integer :profile_status, default: 0
      t.string :phone
      t.integer :starting_pain_duration
      t.integer :activity_level
      t.integer :pace
      t.integer :starting_pain_score
      t.string :dob
      t.string :email
      t.integer :mood_journals_count
      t.integer :food_journals_count
      t.integer :education_modules_count
      t.integer :movement_modules_count
      t.integer :bookmarks_count
      t.integer :smart_goals_count

      t.timestamps
    end
  end
end
