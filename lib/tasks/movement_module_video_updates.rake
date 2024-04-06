
namespace :data do
  desc "Add video ids to movement module completions where users don't have movement units in User data"
  task movement_completions_update: :environment do 
      
      modules = [
        { "id": 1, "videos": [63, 64, 67, 68] },
        { "id": 2, "videos": [69, 70, 71, 72] },
        { "id": 3, "videos": [65, 67, 68] },
        { "id": 4, "videos": [73, 74, 75] },
        { "id": 5, "videos": [66, 67, 68] },
        { "id": 6, "videos": [76, 71, 77] },
        { "id": 7, "videos": [78, 79, 80] },
        { "id": 8, "videos": [81, 74, 82] },
        { "id": 9, "videos": [83, 79, 80] },
        { "id": 10, "videos": [84, 85, 72] },
        { "id": 11, "videos": [86, 79, 80] },
        { "id": 12, "videos": [87, 88, 89] },
        { "id": 13, "videos": [90, 91, 92] },
        { "id": 14, "videos": [93, 85, 75] },
        { "id": 15, "videos": [94, 91, 92] },
        { "id": 16, "videos": [95, 88, 96] },
        { "id": 17, "videos": [97, 91, 92] },
        { "id": 18, "videos": [98, 99, 100, 101] },
        { "id": 19, "videos": [102, 103, 92] },
        { "id": 20, "videos": [104, 105, 106] },
        { "id": 21, "videos": [107, 103, 92] },
        { "id": 22, "videos": [108, 99, 100, 109] },
        { "id": 23, "videos": [110, 103, 92] },
        { "id": 24, "videos": [111, 105, 82] },
        { "id": 25, "videos": [112, 113, 114, 115] },
        { "id": 26, "videos": [116, 117, 100, 118] },
        { "id": 27, "videos": [119, 113, 114, 115] },
        { "id": 28, "videos": [120, 121, 122, 89] },
        { "id": 29, "videos": [123, 113, 114, 115] },
        { "id": 30, "videos": [124, 117, 100, 101] },
        { "id": 31, "videos": [125, 91, 126, 127] },
        { "id": 32, "videos": [128, 121, 122, 106] },
        { "id": 33, "videos": [129, 91, 126, 127] },
        { "id": 34, "videos": [130, 131, 99, 109] },
        { "id": 35, "videos": [132, 91, 126, 127] },
        { "id": 36, "videos": [133, 131, 99, 118] }
      ]

      User.all.each do |user|

        movement_modules = user.movement_modules
        no_completed_movement_units = user.completed_movement_units.empty?

        if movement_modules.any? && no_completed_movement_units
          movement_modules do |mod|
            module_video_info = modules.find { |module_hash| module_hash[:id] == mod.id }
            videos = module_video_info[:videos]
            videos.each do |video|
              data = {
              user_id: user.id,
              module_id: mod.id,
              video_id: video.id,
              status: 0
              }
              MovementModuleCompletion.create(data)
            end
          end
        end
      end
    end

