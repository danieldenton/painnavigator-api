class CreateOnboards < ActiveRecord::Migration[6.1]
  def change
    create_table :onboards do |t|
      t.integer :starting_pain_score
      t.integer :enjoyment_of_life
      t.integer :activity_interference
      t.string :hopes_to_achieve
      t.string :anxious
      t.string :unable_to_stop_worrying
      t.string :little_interest_or_pleasure
      t.string :depressed
      t.string :type_of_pain
      t.string :pain_injections
      t.string :spine_surgery
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
