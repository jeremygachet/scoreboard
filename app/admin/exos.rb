ActiveAdmin.register Exo do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :comment, :points, :position
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


collection_action :validate, method: [:get, :post] do
end



controller do

    # validate an exercice page
    def validate
        @page_title = "Validez un exercice"
        @teams = Team.all
        @exos = Exo.all
        respond_to do |format|
        format.html {
            render
        }
        end

    end
end

end
