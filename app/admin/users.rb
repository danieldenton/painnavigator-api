ActiveAdmin.register User do
  permit_params :role, :provider_id, :uid, :first_name, :last_name, :gender, :commitment, :onboard_status, :profile_status, :phone, :starting_pain_duration, :activity_level, :pace, :starting_pain_score, :dob, :email, :mood_journals_count, :food_journals_count, :education_modules_count, :movement_modules_count, :bookmarks_count, :smart_goals_count
  
  
end
