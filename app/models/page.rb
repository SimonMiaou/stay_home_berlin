# frozen_string_literal: true

class Page < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true
end
