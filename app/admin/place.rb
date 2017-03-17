ActiveAdmin.register Place do

  permit_params :title, :description, :image

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end


  index do
    selectable_column
    id_column
    column :image do |place|
      image_tag place.image.url(:thumb)
    end
    column :title do |place|
      link_to place.title, admin_place_path(place)
    end
    column :description do |place|
      place.description[0..20]
    end
    actions
  end

end
