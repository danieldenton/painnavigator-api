class AddNewAttributeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :new_attribute, :integer[]
  end
end
