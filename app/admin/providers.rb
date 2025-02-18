ActiveAdmin.register Provider do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :code, :users_count, :condensed_program

  index do
    id_column
    column :name
    column :code
    column :condensed_program
    column :users_count
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :code, :users_count]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
