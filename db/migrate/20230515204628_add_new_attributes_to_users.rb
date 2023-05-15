class AddNewAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :depressed, :string
    add_column :users, :anxious, :string
    add_column :users, :unable_to_stop_worrying, :string
    add_column :users, :little_interest_or_pleasure, :string
    add_column :users, :pain_injections, :string
    add_column :users, :spine_surgery, :string
  end
end
