class AddTextErrorPayloadToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :text_error_payload, :text
  end
end
