class CreateDailyPainScores < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_pain_scores do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :scores, array: true, default: []
      t.timestamps
    end
  end
end
