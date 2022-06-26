class CreateMoodJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :mood_journals do |t|
      t.integer :user_id
      t.string :feeling
      t.integer :intensity
      t.string :situation
      t.string :who_i_was_with
      t.string :primary_thought
      t.string :cognitive_distortions
      t.float :date_time_value

      t.timestamps
    end
  end
end
