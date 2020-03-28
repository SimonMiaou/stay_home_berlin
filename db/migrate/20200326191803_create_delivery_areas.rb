# frozen_string_literal: true

class CreateDeliveryAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_areas, id: :uuid do |t|
      t.string :name
      t.string :postcode
      t.timestamps
    end
  end
end
