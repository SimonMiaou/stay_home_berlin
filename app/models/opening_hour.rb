# frozen_string_literal: true

class OpeningHour < ApplicationRecord
  belongs_to :business

  validates :day, presence: true,
                  numericality: { only_integer: true,
                                  greater_than_or_equal_to: 0,
                                  less_than_or_equal_to: 6 }
  validates :opening_time, :closing_time, presence: true

  default_scope { order(day: :asc, opening_time: :asc) }

  def self.days_as_form_collection
    [
      ['Sunday', 0],
      ['Monday', 1],
      ['Tuesday', 2],
      ['Wednesday', 3],
      ['Thursday', 4],
      ['Friday', 5],
      ['Saturday', 6]
    ]
  end

  def day_as_string
    %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday][day]
  end
end
