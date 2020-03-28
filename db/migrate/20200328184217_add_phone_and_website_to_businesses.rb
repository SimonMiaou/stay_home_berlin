# frozen_string_literal: true

class AddPhoneAndWebsiteToBusinesses < ActiveRecord::Migration[6.0]
  def change
    change_table :businesses, bulk: true do |t|
      t.string :phone
      t.string :website
    end
  end
end
