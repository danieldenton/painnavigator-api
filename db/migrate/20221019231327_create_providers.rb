class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :code
      t.integer :users_count

      t.timestamps
    end
  end
end
