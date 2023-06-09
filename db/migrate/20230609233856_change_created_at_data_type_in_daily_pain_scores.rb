class ChangeCreatedAtDataTypeInDailyPainScores < ActiveRecord::Migration[6.1]
  def change
    change_column :daily_pain_scores, :created_at, :integer
  end
end
