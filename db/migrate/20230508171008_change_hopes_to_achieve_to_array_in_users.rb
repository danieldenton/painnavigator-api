class ChangeHopesToAchieveToArrayInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :hopes_to_achieve, :string, :default => nil
  end
  def down
  end
end
