class ChangeDateTimeValueToBigIntInDailyPainScores < ActiveRecord::Migration[6.1]
  def up
    change_column :daily_pain_scores, :date_time_value, :numeric, precision: 15, scale: 6
  end

  def down
    change_column :daily_pain_scores, :date_time_value, :integer
  end
end
