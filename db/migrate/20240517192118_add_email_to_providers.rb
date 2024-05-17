class AddEmailToProviders < ActiveRecord::Migration[6.1]
  def change
    add_column :providers, :email, :string
  end
end
