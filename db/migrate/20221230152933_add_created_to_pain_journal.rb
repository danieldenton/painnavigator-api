class AddCreatedToPainJournal < ActiveRecord::Migration[6.1]
  def change
    add_column :pain_journals, :created, :string
  end
end
