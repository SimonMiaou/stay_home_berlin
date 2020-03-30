# frozen_string_literal: true

ActiveAdmin.register Page do
  permit_params :slug, :menu_order, :title, :content

  index do
    selectable_column
    id_column
    column :slug
    column :menu_order
    column :title
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :slug
      row :menu_order
      row :title
      row(:content) { |b| simple_format b.content }
      row :created_at
      row :updated_at
    end
  end
end
