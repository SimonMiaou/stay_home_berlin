# frozen_string_literal: true

class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages, id: :uuid do |t|
      t.string :slug
      t.string :title
      t.text :content

      t.timestamps

      t.index [:slug], unique: true
    end
  end
end
