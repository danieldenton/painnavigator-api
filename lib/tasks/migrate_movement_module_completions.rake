
namespace :data do
  desc "Migrate movement completion from User table to MovementModuleCompletions"
  task migrate_movement_completions: :environment do
    
    User.all.each do |user|
      completed_movement_units = user.completed_movement_units
      
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

      current_module_id = 1

      completed_movement_units.each do |video_id|

        module_info = modules.find { |mod| mod[:id] == current_module_id }

        if module_info && module_info[:videos].include?(video_id)
          data = {
            user_id: user.id,
            module_id: current_module_id,
            video_id: video_id,
            status: 0
            }
          
     
          MovementModuleCompletion.create(data)
        else
          current_module_id += 1
        end

      end
    end
  end
end
