
namespace :data do
  desc "Delete MovementModuleCompletions with nil video_id"
  task clean_up_movement_module_completions: :environment do
    MovementModuleCompletion.where(video_id: nil).delete_all
    puts "Deleted MovementModuleCompletions with nil video_id"
  end
end
