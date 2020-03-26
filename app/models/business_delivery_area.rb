# frozen_string_literal: true

class BusinessDeliveryArea < ApplicationRecord
  belongs_to :business
  belongs_to :delivery_area
end
