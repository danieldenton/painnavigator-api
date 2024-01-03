ActiveAdmin.register DailyPainScore do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :score, :date_time_value

  index do
    id_column
    column :user_id
    column :score
    column :date_time_value
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :score, :date_time_value]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
