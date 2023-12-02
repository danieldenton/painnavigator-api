class CreateOutcomes < ActiveRecord::Migration[6.1]
  def change
    create_table :outcomes do |t|
      t.string :recommendation
      t.integer :outcome_enjoyment_of_life
      t.integer :outcome_activity_interference
      t.integer :outcome_anxious
      t.integer :outcome_unable_to_stop_worrying
      t.integer :outcome_little_interest_or_pleasure
      t.integer :outcome_depressed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
