class AddWellnessCoachIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :wellness_coach_id, :integer
  end
end
