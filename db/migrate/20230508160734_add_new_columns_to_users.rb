class AddNewColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :enjoyment_of_life, :integer
    add_column :users, :activity_interference, :integer
    add_column :users, :hopes_to_achieve, :string
  end
end
