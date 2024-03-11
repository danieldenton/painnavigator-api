class AgainAddAccessToWellnessCoachToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :access_to_wellness_coach, :boolean, default: false, null: false
  end
end