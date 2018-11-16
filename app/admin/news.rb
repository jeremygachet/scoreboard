ActiveAdmin.register News do
 permit_params :title, :content, :published, :published_datetime, :link
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
    column :title
    column :content do |n|
        truncate(strip_tags(n.content), omision: "...", length: 64)
    end
    column :published
    column :published_datetime
    actions

end


show do
    attributes_table do

        row :title
        row :content do |n|
            raw( n.content)
        end
        row :link
        row :published
        row :published_datetime
        row :created_at
        row :updated_at
    end
end



form do |f|
    f.object.published_datetime = DateTime.now if f.object.published_datetime.nil?

    f.inputs do
        f.input :title
        f.input :content, as: :quill_editor
        f.input :link
        f.input :published
        # f.input :published_datetime, as: :date_time_picker
    end
    actions
end



end
