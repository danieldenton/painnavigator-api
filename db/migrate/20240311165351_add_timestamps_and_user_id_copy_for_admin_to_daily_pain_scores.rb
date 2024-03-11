class AddTimestampsAndUserIdCopyForAdminToDailyPainScores < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_pain_scores, :created_at, :datetime
    add_column :daily_pain_scores, :updated_at, :datetime
    add_column :daily_pain_scores, :user_id_copy_for_admin, :integer
  end
end
