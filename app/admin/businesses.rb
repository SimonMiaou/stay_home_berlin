# frozen_string_literal: true

ActiveAdmin.register Business do
  permit_params :name, :address, :business_type, :business_sub_type, :description, :comment

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
end
