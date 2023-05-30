ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :role, :uid, :first_name, :last_name, :gender, :commitment, :onboard_status, :profile_status, :phone, :starting_pain_duration, :activity_level, :pace, :starting_pain_score, :enjoyment_of_life, :activity_interference, :hopes_to_achieve, :dob, :email, :mood_journals_count, :food_journals_count, :education_progress, :movement_progress, :bookmarks_count, :smart_goals_count, :provider_id, :wellness_coach_id, :completed_program
 
  index do
    id_column
    column :role
    column :first_name
    column :last_name
    column :gender
    column :commitment
    column :onboard_status
    column :profile_status
    column :phone
    column :starting_pain_duration
    column :activity_level
    column :pace
    column :starting_pain_score
    column :enjoyment_of_life
    column :activity_interference
    column :hopes_to_achieve
    column :dob
    column :email
    column :mood_journals_count
    column :food_journals_count
    column :education_progress, sortable: :education_progress do |user|
      progress = user.education_progress["progress"] - 1
      last_completed_date = user.education_progress["last_completed_date"]
      if last_completed_date.nil?
        "none"
      else
        formatted_date = Time.at(last_completed_date / 1000).strftime('%m-%d-%y')
        "#{progress} on #{formatted_date}"
      end
    end
    column :movement_progress, sortable: :movement_progress do |user|
      progress = user.movement_progress["progress"] - 1
      last_completed_date = user.movement_progress["last_completed_date"]

      if last_completed_date.nil?
        "none"
      else
        formatted_date = Time.at(last_completed_date / 1000).strftime('%m-%d-%y')
        "#{progress} on #{formatted_date}"
      end
    end
    column :smart_goals_count
    column :provider_id
    column :completed_program
    actions
  end
  
  #
  # or
  #
  # permit_params do
  #   permitted = [:role, :uid, :first_name, :last_name, :gender, :commitment, :onboard_status, :profile_status, :phone, :starting_pain_duration, :activity_level, :pace, :starting_pain_score, :dob, :email, :mood_journals_count, :food_journals_count, :education_modules_count, :movement_modules_count, :bookmarks_count, :smart_goals_count, :provider_id, :wellness_coach_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
