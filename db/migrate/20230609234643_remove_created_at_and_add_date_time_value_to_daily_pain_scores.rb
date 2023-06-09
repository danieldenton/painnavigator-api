class RemoveCreatedAtAndAddDateTimeValueToDailyPainScores < ActiveRecord::Migration[6.1]
  def up
    remove_column :daily_pain_scores, :created_at
    add_column :daily_pain_scores, :date_time_value, :integer
  end

  def down
    add_column :daily_pain_scores, :created_at, :datetime
    remove_column :daily_pain_scores, :date_time_value
  end
end
