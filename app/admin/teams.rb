ActiveAdmin.register Team do
    include Pundit
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :company, :logo
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
    form title: 'Créer les equipes' do |f|
        f.inputs do
            f.input :name
            f.input :company
            f.input :logo, as: :file
        end
        actions
    end

    show do 
        attributes_table do

            row :name
            row :company
            row :logo do |t|
                if t.logo.attached? 
                    image_tag t.logo.variant(resize: '250x250>').processed  # on-demand processing
                end
            end
            row :created_at
            row :updated_at
        end
    end

end
