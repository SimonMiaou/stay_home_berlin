# frozen_string_literal: true

ActiveAdmin.register Business do
  permit_params :name,
                :address,
                :business_type,
                :business_sub_type,
                :description,
                :comment,
                delivery_area_ids: []

  form do |f|
    f.semantic_errors
    f.inputs
    inputs do
      f.input :delivery_areas, as: :check_boxes,
                               collection: DeliveryArea.order(:postcode)
                                                       .map { |da| ["#{da.postcode} - #{da.name}", da.id] }
    end
    f.actions
  end

  remove_filter :business_delivery_areas

  preserve_default_filters!
  filter :delivery_areas, collection: -> { DeliveryArea.order(:postcode).map { |da| ["#{da.postcode} - #{da.name}", da.id] } }

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

  sidebar 'Delivery Areas', only: [:show] do
    table_for business.delivery_areas do
      column :postcode
      column :name
    end
  end
end
