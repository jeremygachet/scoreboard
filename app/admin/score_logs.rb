ActiveAdmin.register ScoreLog do
    actions :index, :show

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
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
        column :score
        column :created_at
        column :published
    end



    action_item :publish_last_button do
        link_to 'Publier le dernier status', publish_last_admin_score_logs_path()
    end

    collection_action :publish_last do end



    controller do
        def publish_last
            ScoreLog.last.update_attribute(:published, true)
            redirect_back fallback_location: {action: 'index'}
        end
    end

end
