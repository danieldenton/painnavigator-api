class AddEducationProgramToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :education_program, :integer, default: 1
  end
end
