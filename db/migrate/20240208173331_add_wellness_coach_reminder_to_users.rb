class AddWellnessCoachReminderToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :wellness_coach_reminder, :integer, default: 0
  end
end
