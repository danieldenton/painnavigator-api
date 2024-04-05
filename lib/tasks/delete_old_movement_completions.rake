
namespace :data do
  desc "Delete MovementModuleCompletions with nil video_id"
  task clean_up_movement_module_completions: :environment do
    MovementModuleCompletion.where(video_id: nil).delete_all
  end
end
