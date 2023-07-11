class AddLastDateOnAppToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_date_on_app, :string
  end
end
