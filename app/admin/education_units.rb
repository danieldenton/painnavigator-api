ActiveAdmin.register EducationUnit do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :length, :post_video_destination, :skippable, :summary, :steps, :condensed_program
  #
  # or
  #
  # permit_params do
  #   permitted = [:module_order, :module_type, :name, :length, :post_video_destination, :source, :skippable, :summary, :steps, :condensed_program]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
