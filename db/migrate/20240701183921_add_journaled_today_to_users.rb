class AddJournaledTodayToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :journaled_today, :boolean, default: false
  end
end
