class CreateEducationModuleCompletions < ActiveRecord::Migration[6.1]
  def change
    create_table :education_module_completions do |t|
      t.integer :module_id
      t.integer :status
      t.integer :user_id
      t.float :date_time_value

      t.timestamps
    end
  end
end
