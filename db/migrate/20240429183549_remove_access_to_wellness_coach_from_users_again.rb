class RemoveAccessToWellnessCoachFromUsersAgain < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :access_to_wellness_coach
  end
end
