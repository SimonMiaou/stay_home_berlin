# frozen_string_literal: true

class AddOrderUrlToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :order_url, :string
  end
end
