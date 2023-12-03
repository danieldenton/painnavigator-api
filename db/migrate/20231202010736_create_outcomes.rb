class CreateOutcomes < ActiveRecord::Migration[6.1]
  def change
    create_table :outcomes do |t|
      t.integer :recommendation
      t.integer :outcome_enjoyment_of_life
      t.integer :outcome_activity_interference
      t.string :outcome_anxious
      t.string :outcome_unable_to_stop_worrying
      t.string :outcome_little_interest_or_pleasure
      t.string :outcome_depressed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
