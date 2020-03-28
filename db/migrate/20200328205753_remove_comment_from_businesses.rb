# frozen_string_literal: true

class RemoveCommentFromBusinesses < ActiveRecord::Migration[6.0]
  def change
    remove_column :businesses, :comment, :string
  end
end
