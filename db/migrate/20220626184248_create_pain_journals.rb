class CreatePainJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :pain_journals do |t|
      t.integer :intensity
      t.string :situation
      t.string :feeling
      t.string :who_i_was_with
      t.string :coping_strategies
      t.string :notes
      t.integer :intensity_after
      t.integer :user_id
      t.float :date_time_value

      t.timestamps
    end
  end
end
