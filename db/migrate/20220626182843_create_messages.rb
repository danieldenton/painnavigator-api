class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :body
      t.integer :status, default: 0
      t.float :date_time_value

      t.timestamps
    end
  end
end
