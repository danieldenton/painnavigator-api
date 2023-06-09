class RemoveUpdatedAtFromDailyPainScores < ActiveRecord::Migration[6.0]
  def up
    remove_column :daily_pain_scores, :updated_at, :datetime
  end

  def down
    add_column :daily_pain_scores, :updated_at, :datetime
  end
end