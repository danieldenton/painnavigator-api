class AddTimeStampToPainJournal < ActiveRecord::Migration[6.1]
  def change
    add_column :pain_journals, :time_stamp, :integer
  end
end
