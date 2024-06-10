class AddAppVersionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :app_version, :string
  end
end
