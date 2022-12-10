class AddCondensedProgramToProvider < ActiveRecord::Migration[6.1]
  def change
    add_column :providers, :condensed_program, :boolean, default: false
  end
end
