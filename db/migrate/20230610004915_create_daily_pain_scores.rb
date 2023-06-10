class CreateDailyPainScores < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_pain_scores do |t|
      t.bigint :user_id, null: false
      t.integer :score
      t.bigint :date_time_value
    end
  end
end
