class AddAppUpdateRequiredToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :app_update_required, :boolean, default: false
  end
end
