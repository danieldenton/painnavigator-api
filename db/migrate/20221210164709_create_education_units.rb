class CreateEducationUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :education_units do |t|
      t.integer :module_order
      t.string :module_type
      t.string :name
      t.integer :length
      t.string :post_video_destination
      t.string :source
      t.boolean :skippable
      t.string :summary
      t.string :steps
      t.boolean :condensed_program

      t.timestamps
    end
  end
end
