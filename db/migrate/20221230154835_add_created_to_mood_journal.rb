class AddCreatedToMoodJournal < ActiveRecord::Migration[6.1]
  def change
    add_column :mood_journals, :created, :string
  end
end
