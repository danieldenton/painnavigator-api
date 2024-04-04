
namespace :data do
  desc "Migrate movement completion from User table to MovementModuleCompletions"
  task migrate_movement_completions: :environment do
    # Iterate through each user
    User.all.each do |user|
      # Assuming user.array_of_ints is the attribute containing the array of ints for each user
      completed_movement_units = user.completed_movement_units

      # Assuming you have the module data as an array of hashes
      modules = [
        { "id": 1, "videos": [63, 64, 67, 68] },
        {
          "id": 2,
          "name": "Foundations: Breathing",
          "videos": [69, 70, 71, 72]
        },
        {
          "id": 3,
          "name": "Foundations 2",
          "videos": [65, 67, 68]
        },
        {
          "id": 4,
          "name": "Foundations: Movement",
          "videos": [73, 74, 75]
        },
        {
          "id": 5,
          "name": "Foundations 3",
          "videos": [66, 67, 68]
        },
        {
          "id": 6,
          "name": "Foundations: In the Garden",
          "videos": [76, 71, 77]
        },
        {
          "id": 7,
          "name": "Progressing 1",
          "videos": [78, 79, 80]
        },
        {
          "id": 8,
          "name": "Progressing: Awareness",
          "videos": [81, 74, 82]
        },
        {
          "id": 9,
          "name": "Progressing 2",
          "videos": [83, 79, 80]
        },
        {
          "id": 10,
          "name": "Progressing: Breathing",
          "videos": [84, 85, 72]
        },
        {
          "id": 11,
          "name": "Progressing 3",
          "videos": [86, 79, 80]
        },
        {
          "id": 12,
          "name": "Progressing: Gratitude",
          "videos": [87, 88, 89]
        },
        {
          "id": 13,
          "name": "Strength 1",
          "videos": [90, 91, 92]
        },
        {
          "id": 14,
          "name": "Strength: Movement",
          "videos": [93, 85, 75]
        },
        {
          "id": 15,
          "name": "Strength 2",
          "videos": [94, 91, 92]
        },
        {
          "id": 16,
          "name": "Strength: Energy Ball",
          "videos": [95, 88, 96]
        },
        {
          "id": 17,
          "name": "Strength 3",
          "videos": [97, 91, 92]
        },
        {
          "id": 18,
          "name": "Strength: Water",
          "videos": [98, 99, 100, 101]
        },
        {
          "id": 19,
          "name": "Endurance 1",
          "videos": [102, 103, 92]
        },
        {
          "id": 20,
          "name": "Endurance: Present",
          "videos": [104, 105, 106]
        },
        {
          "id": 21,
          "name": "Endurance 2",
          "videos": [107, 103, 92]
        },
        {
          "id": 22,
          "name": "Endurance: Letting Go",
          "videos": [108, 99, 100, 109]
        },
        {
          "id": 23,
          "name": "Endurance 3",
          "videos": [110, 103, 92]
        },
        {
          "id": 24,
          "name": "Endurance: Awareness",
          "videos": [111, 105, 82]
        },
        {
          "id": 25,
          "name": "Core 1",
          "videos": [112, 113, 114, 115]
        },
        {
          "id": 26,
          "name": "Core: Fearlessness",
          "videos": [116, 117, 100, 118]
        },
        {
          "id": 27,
          "name": "Core 2",
          "videos": [119, 113, 114, 115]
        },
        {
          "id": 28,
          "name": "Core: Gratitude",
          "videos": [120, 121, 122, 89]
        },
        {
          "id": 29,
          "name": "Core 3",
          "videos": [123, 113, 114, 115]
        },
        {
          "id": 30,
          "name": "Core: Water",
          "videos": [124, 117, 100, 101]
        },
        {
          "id": 31,
          "name": "Mastering 1",
          "videos": [125, 91, 126, 127]
        },
        {
          "id": 32,
          "name": "Mastering: Present",
          "videos": [128, 121, 122, 106]
        },
        {
          "id": 33,
          "name": "Mastering 2",
          "videos": [129, 91, 126, 127]
        },
        {
          "id": 34,
          "name": "Mastering: Letting Go",
          "videos": [130, 131, 99, 109]
        },
        {
          "id": 35,
          "name": "Mastering 3",
          "videos": [132, 91, 126, 127]
        },
        {
          "id": 36,
          "name": "Mastering: Fearlessness",
          "videos": [133, 131, 99, 118]
        },
        {
          "id": 37,
          "name": "Modules Complete!",
          "videos": [132]
        }
      ]

      # Initialize variables to store movement_module_completions and current module ID
      movement_module_completions = []
      current_module_id = nil

      # Iterate through each video ID in the array_of_ints
      array_of_ints.each do |video_id|
        # Find the module that contains the current video ID
        module_info = modules.find { |module| module[:videos].include?(video_id) }

        if module_info
          # If current module ID is nil or different from the module ID of the current video
          if current_module_id.nil? || current_module_id != module_info[:id]
            # Assign the module ID of the current video to current_module_id
            current_module_id = module_info[:id]
          else
            # If the module ID of the current video is the same as the previous one,
            # increment current_module_id to the next module ID
            current_module_id = modules[(modules.index(module_info) + 1) % modules.length][:id]
          end

          # Create a movement_module_completion
          movement_module_completion = {
            user_id: user.id, # Assuming you want to associate each completion with the user
            module_id: current_module_id,
            video_id: video_id,
            status: 0
          }

          # Add the movement_module_completion to the array
          movement_module_completions << movement_module_completion
        else
          # Handle the case where the video ID does not belong to any module
          puts "Video ID #{video_id} does not belong to any module"
        end
      end

      # Save the movement_module_completions to the database for the current user
      MovementModuleCompletion.create(movement_module_completions)
    end
  end
end
