# frozen_string_literal: true

class DeliveryArea < ApplicationRecord
  validates :name, presence: true

  has_many :business, through: :business_delivery_areas
  has_many :business_delivery_areas, dependent: :destroy
end
