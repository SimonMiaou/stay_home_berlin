# frozen_string_literal: true

class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses, id: :uuid do |t|
      t.string :name
      t.string :address
      t.string :business_type
      t.string :business_sub_type
      t.text :description
      t.text :comment

      t.timestamps
    end
  end
end
