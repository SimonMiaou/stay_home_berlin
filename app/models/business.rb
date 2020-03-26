# frozen_string_literal: true

class Business < ApplicationRecord
  validates :name, presence: true

  has_many :business_delivery_areas, dependent: :destroy
  has_many :delivery_area, through: :business_delivery_areas
end
