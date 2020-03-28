# frozen_string_literal: true

ActiveAdmin.register Business do
  permit_params :name,
                :address,
                :business_type,
                :business_sub_type,
                :description,
                :comment,
                business_delivery_areas_attributes: [:delivery_area_id]

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

  form do |f|
    f.semantic_errors
    f.inputs
    f.has_many :business_delivery_areas, new_record: true, allow_destroy: true do |da_f|
      da_f.input :delivery_area,
                 collection: DeliveryArea.order(:postcode)
                                         .map { |da| ["#{da.postcode} - #{da.name}", da.id] }
    end
    f.actions
  end
end
