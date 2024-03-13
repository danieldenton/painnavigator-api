class AddVideoIdToMovementModuleCompletions < ActiveRecord::Migration[6.1]
  def change
    add_column :movement_module_completions, :video_id, :integer
  end
end
