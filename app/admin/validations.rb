ActiveAdmin.register Validation do
    include Pundit
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :team_id, :exo_id
actions :index, :show, :new, :create
includes :team, :exo


#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


    index do 
        id_column
        column :team
        column :exo do |v|
            v.exo.name_points
        end
        column :created_at
    end


end
