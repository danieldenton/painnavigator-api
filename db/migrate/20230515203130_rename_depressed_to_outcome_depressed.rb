class RenameDepressedToOutcomeDepressed < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :depressed, :outcome_depressed
    rename_column :users, :anxious, :outcome_anxious
    rename_column :users, :unable_to_stop_worrying, :outcome_unable_to_stop_worrying
    rename_column :users, :little_interest_or_pleasure, :outcome_little_interest_or_pleasure
  end
end
