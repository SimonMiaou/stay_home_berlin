# frozen_string_literal: true

class Page < ApplicationRecord
  validates :slug, :title, presence: true
end
