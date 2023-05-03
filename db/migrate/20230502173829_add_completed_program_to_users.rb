class AddCompletedProgramToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :completed_program, :boolean
  end
end
