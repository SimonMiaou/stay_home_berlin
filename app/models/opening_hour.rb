# frozen_string_literal: true

class OpeningHour < ApplicationRecord
  belongs_to :business

  validates :day_number, numericality: { only_integer: true,
                                         greater_than_or_equal_to: 0,
                                         less_than_or_equal_to: 6 }
end
