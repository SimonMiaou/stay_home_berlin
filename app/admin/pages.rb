# frozen_string_literal: true

ActiveAdmin.register Page do
  permit_params :slug, :title, :content

  index do
    selectable_column
    id_column
    column :slub
    column :title
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :slub
      row :title
      row(:content) { |b| simple_format b.content }
      row :created_at
      row :updated_at
    end
  end
end
