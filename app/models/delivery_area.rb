# frozen_string_literal: true

class DeliveryArea < ApplicationRecord
  validates :name, presence: true
  validates :postcode, presence: true,
                       length: { is: 5 },
                       format: { with: /\A\d+x*\z/,
                                 message: 'only digits or x at the end' }

  has_many :business, through: :business_delivery_areas
  has_many :business_delivery_areas, dependent: :destroy

  def self.as_form_collection
    order(:postcode).map { |da| ["#{da.postcode} - #{da.name}", da.id] }
  end
end
