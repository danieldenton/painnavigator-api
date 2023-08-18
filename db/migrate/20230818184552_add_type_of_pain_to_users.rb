class AddTypeOfPainToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type_of_pain, :string
  end
end
