class ChangeHopesToAchieveToArrayInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :hopes_to_achieve, :string[]
  end
end
