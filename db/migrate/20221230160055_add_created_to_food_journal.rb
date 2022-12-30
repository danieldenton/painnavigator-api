class AddCreatedToFoodJournal < ActiveRecord::Migration[6.1]
  def change
    add_column :food_journals, :created, :string
  end
end
