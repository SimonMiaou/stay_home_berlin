# frozen_string_literal: true

ActiveAdmin.register Business do
  permit_params :name,
                :address,
                :business_sub_type,
                :business_type,
                :comment,
                :description,
                :phone,
                :website,
                delivery_area_ids: []

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :business_sub_type
      f.input :business_type
      f.input :address
      f.input :phone
      f.input :website
      f.input :description
      f.input :comment
    end
    f.inputs do
      f.input :delivery_areas, as: :check_boxes,
                               collection: DeliveryArea.as_form_collection
    end
    f.actions
  end

  remove_filter :business_delivery_areas

  preserve_default_filters!
  filter :delivery_areas, collection: -> { DeliveryArea.as_form_collection }

  index do
    selectable_column
    id_column
    column :name
    column :business_type
    column :business_sub_type
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :business_sub_type
      row :business_type
      row :address
      row :phone
      row :website
      row :description
      row :comment
      row :created_at
      row :updated_at
    end
  end

  sidebar 'Delivery Areas', only: [:show] do
    table_for business.delivery_areas do
      column :postcode
      column :name
    end
  end
end
