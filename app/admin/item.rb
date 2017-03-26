ActiveAdmin.register Item do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :place_id, :price
form do |f|
  f.inputs do
    f.input :place, include_blank: false, as: :select, collection: Place.all
    f.input :title
    f.input :price
    f.input :description
  end
  f.actions
end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
