class AddDatesOnAppToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :dates_on_app, :string, array: true
  end
end
