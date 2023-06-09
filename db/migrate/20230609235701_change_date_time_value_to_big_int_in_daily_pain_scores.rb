class ChangeDateTimeValueToBigIntInDailyPainScores < ActiveRecord::Migration[6.1]
  def change
    change_column :daily_pain_scores, :date_time_value, :bigint
  end
end
