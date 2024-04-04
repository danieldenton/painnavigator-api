
namespace :data do
  desc "Migrate movement completion from User table to MovementModuleCompletions"
  task migrate_movement_completions: :environment do
    
    User.all.each do |user|
      completed_movement_units = user.completed_movement_units
      uid = user.uid
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
        {
          "id": 19,
          "videos": [102, 103, 92]
        },
        {
          "id": 20,
          "videos": [104, 105, 106]
        },
        {
          "id": 21,
          "videos": [107, 103, 92]
        },
        {
          "id": 22,
          "videos": [108, 99, 100, 109]
        },
        {
          "id": 23,
          "videos": [110, 103, 92]
        },
        {
          "id": 24,
          "videos": [111, 105, 82]
        },
        {
          "id": 25,
          "videos": [112, 113, 114, 115]
        },
        {
          "id": 26,
          "videos": [116, 117, 100, 118]
        },
        {
          "id": 27,
          "videos": [119, 113, 114, 115]
        },
        {
          "id": 28,
          "videos": [120, 121, 122, 89]
        },
        {
          "id": 29,
          "videos": [123, 113, 114, 115]
        },
        {
          "id": 30,
          "videos": [124, 117, 100, 101]
        },
        {
          "id": 31,
          "videos": [125, 91, 126, 127]
        },
        {
          "id": 32,
          "videos": [128, 121, 122, 106]
        },
        {
          "id": 33,
          "videos": [129, 91, 126, 127]
        },
        {
          "id": 34,
          "videos": [130, 131, 99, 109]
        },
        {
          "id": 35,
          "videos": [132, 91, 126, 127]
        },
        {
          "id": 36,
          "videos": [133, 131, 99, 118]
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
