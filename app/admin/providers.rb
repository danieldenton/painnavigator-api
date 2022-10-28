ActiveAdmin.register Provider do
  permit_params :name, :code, :users_count
end
