# frozen_string_literal: true

class Business < ApplicationRecord
  validates :name, presence: true

  has_many :business_delivery_areas, dependent: :destroy
  has_many :delivery_areas, through: :business_delivery_areas
  has_many :opening_hours, dependent: :destroy

  accepts_nested_attributes_for :opening_hours, allow_destroy: true
end
