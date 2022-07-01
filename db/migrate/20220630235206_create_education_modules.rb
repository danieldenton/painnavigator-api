class CreateEducationModules < ActiveRecord::Migration[6.1]
  def change
    create_table :education_modules do |t|
      t.integer :module_id
      t.integer :module_type
      t.string :name
      t.integer :length
      t.string :post_completion_destination
      t.string :source
      t.integer :skippable
      t.string :summary

      t.timestamps
    end
  end
end
