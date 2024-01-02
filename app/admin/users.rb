ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :role, :uid, :first_name, :last_name, :profile_status, :phone, :starting_pain_score, :enjoyment_of_life, :activity_interference, :hopes_to_achieve, :dob, :email, :pain_journals, :mood_journals, :food_journals, :education_program, :education_progress, :movement_progress, :bookmarks_count, :smart_goals, :provider_id, :wellness_coach_id, :completed_program
  permit_params :role, :first_name
  
  index do
    id_column
    column :role
    column :first_name
    # column :last_name
    # column :profile_status
    # column :phone
    # column :starting_pain_score
    # column :enjoyment_of_life
    # column :activity_interference
    # column :hopes_to_achieve
    # column :dob
    # column :email
    # column :provider_id
    # column "Education Program Length", sortable: :education_program do |user|
    #   if user.education_program == 1
    #     "67"
    #   elsif user.education_program == 2
    #     "24"
    #   elsif user.education_program == 3
    #     "48"
    #   elsif user.education_program == 4
    #     "45"
    #   elsif user.education_program == 5
    #     "43"
    #   elsif user.education_program == 6
    #     "46"
    #   elsif user.education_program == 7
    #     "64"
    #   elsif user.education_program == 8
    #     "62"
    #   elsif user.education_program == 9
    #     "65"
    #   elsif user.education_program == 10
    #     nil
    #   end
    # end

    # column :education_progress, sortable: :education_progress do |user|
    #   progress = user.education_progress["education_progress"] ? user.education_progress["education_progress"] - 1 : user.education_progress["progress"]
    #   last_completed_date = user.education_progress["last_completed_date"]
    #   if last_completed_date.nil?
    #     "none"
    #   else
    #     formatted_date = Time.at(last_completed_date / 1000).strftime('%m-%d-%y')
    #     "#{progress} on #{formatted_date}"
    #   end
    # end
    # column :movement_progress, sortable: :movement_progress do |user|
    #   progress = user.movement_progress["progress"] - 1
    #   last_completed_date = user.movement_progress["last_completed_date"]

    #   if last_completed_date.nil?
    #     "none"
    #   else
    #     formatted_date = Time.at(last_completed_date / 1000).strftime('%m-%d-%y')
    #     "#{progress} on #{formatted_date}"
    #   end
    # end
    # column "Pain Journals Count", sortable: :pain_journals do |user|
    #   user.pain_journals.count
    # end
    # column "Mood Journals Count", sortable: :mood_journals do |user|
    #   user.mood_journals.count
    # end
    # column "Food Journals Count", sortable: :food_journals do |user|
    #    user.food_journals.count
    # end
    # column "Smart Goals Count", sortable: :smart_goals do |user|
    #   user.smart_goals.count
    # end
    # column :completed_program
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
