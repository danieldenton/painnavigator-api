class AddDefaultToCompletedProgramInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :completed_program, :boolean, default: false
  end
end
