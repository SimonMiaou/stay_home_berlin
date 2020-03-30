# frozen_string_literal: true

class Page < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
  validates :menu_order, numericality: { only_integer: true }, allow_nil: true
  validates :title, presence: true
end
