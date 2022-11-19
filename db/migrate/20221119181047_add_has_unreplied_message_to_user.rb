class AddHasUnrepliedMessageToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :has_unreplied_message, :boolean, default: false
  end
end
