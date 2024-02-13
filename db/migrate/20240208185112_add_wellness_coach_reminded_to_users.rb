class AddWellnessCoachRemindedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :wellness_coach_reminded, :boolean, default: true
  end
end
