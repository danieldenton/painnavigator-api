class AddOptOutSmsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :opt_out_sms, :boolean, default: false
  end
end
