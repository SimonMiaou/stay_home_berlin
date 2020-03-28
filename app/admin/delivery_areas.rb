# frozen_string_literal: true

ActiveAdmin.register DeliveryArea do
  permit_params :name, :postcode

  index do
    selectable_column
    id_column
    column :name
    column :postcode
    actions
  end
end
