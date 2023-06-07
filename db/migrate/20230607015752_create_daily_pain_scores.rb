class CreateDailyPainScores < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_pain_scores do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :score
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
