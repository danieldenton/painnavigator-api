class AddDailyPainScoresToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :daily_pain_scores, :integer, array: true, default: []
  end
end
