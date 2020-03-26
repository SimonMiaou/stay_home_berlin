# frozen_string_literal: true

class CreateBusinessDeliveryAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :business_delivery_areas, id: :uuid do |t|
      t.uuid :business_id
      t.uuid :delivery_area_id
      t.timestamps
    end
  end
end
