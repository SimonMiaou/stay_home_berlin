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
end
