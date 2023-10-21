class AddAccessToWellnessCoachToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :access_to_wellness_coach, :boolean, default: true
  end
end

