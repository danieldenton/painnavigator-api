ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :role, :uid, :first_name, :last_name, :gender, :commitment, :onboard_status, :profile_status, :phone, :starting_pain_duration, :activity_level, :pace, :starting_pain_score, :dob, :email, :mood_journals_count, :food_journals_count, :education_modules_count, :movement_modules_count, :bookmarks_count, :smart_goals_count, :provider_id, :wellness_coach_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:role, :uid, :first_name, :last_name, :gender, :commitment, :onboard_status, :profile_status, :phone, :starting_pain_duration, :activity_level, :pace, :starting_pain_score, :dob, :email, :mood_journals_count, :food_journals_count, :education_modules_count, :movement_modules_count, :bookmarks_count, :smart_goals_count, :provider_id, :wellness_coach_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
