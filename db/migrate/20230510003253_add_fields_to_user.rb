class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :recommendation, :integer
    add_column :users, :outcome_enjoyment_of_life, :integer
    add_column :users, :outcome_activity_interference, :integer
    add_column :users, :anxious, :string
    add_column :users, :unable_to_stop_worrying, :string
    add_column :users, :little_interest_or_pleasure, :string
    add_column :users, :depressed, :string
  end
end
