class CreateDailyPainScores < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_pain_scores do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :daily_scores, array: true, default: [], null: false

      t.timestamps
    end
  end
end
