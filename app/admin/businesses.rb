# frozen_string_literal: true

ActiveAdmin.register Business do
  permit_params :name,
                :address,
                :business_type,
                :business_sub_type,
                :description,
                :comment,
                delivery_area_ids: []

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

  form do |f|
    f.semantic_errors
    f.inputs
    f.input :delivery_areas, as: :check_boxes,
                             collection: DeliveryArea.order(:postcode)
                                                     .map { |da| ["#{da.postcode} - #{da.name}", da.id] }
    f.actions
  end
end