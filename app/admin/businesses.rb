# frozen_string_literal: true

ActiveAdmin.register Business do
  permit_params :name,
                :address,
                :business_sub_type,
                :business_type,
                :description,
                :order_url,
                :phone,
                :website,
                delivery_area_ids: [],
                opening_hours_attributes: %i[day opening_time closing_time]

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :business_sub_type
      f.input :business_type
      f.input :address
      f.input :phone
      f.input :website
      f.input :order_url
      f.input :description
    end
    f.inputs do
      f.has_many :opening_hours, allow_destroy: true do |oh_f|
        oh_f.input :day, as: :select, collection: OpeningHour.days_as_form_collection
        oh_f.input :opening_time
        oh_f.input :closing_time
      end
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
      row :order_url
      row :description
      row :created_at
      row :updated_at
    end
  end

  sidebar 'Opening Hours', only: [:show] do
    table_for business.opening_hours do
      column(:day, &:day_as_string)
      column(:opening_time) { |oh| oh.opening_time.strftime '%H:%M' }
      column(:closing_time) { |oh| oh.closing_time.strftime '%H:%M' }
    end
  end

  sidebar 'Delivery Areas', only: [:show] do
    table_for business.delivery_areas do
      column :postcode
      column :name
    end
  end
end
