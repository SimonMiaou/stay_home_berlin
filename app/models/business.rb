# frozen_string_literal: true

class Business < ApplicationRecord
  validates :name, presence: true

  has_many :business_delivery_areas, dependent: :destroy
  has_many :delivery_areas, through: :business_delivery_areas

  accepts_nested_attributes_for :business_delivery_areas, allow_destroy: true
end
