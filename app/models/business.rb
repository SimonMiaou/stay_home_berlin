# frozen_string_literal: true

class Business < ApplicationRecord
  validates :name, presence: true

  has_many :business_delivery_areas, dependent: :destroy
  has_many :delivery_areas, through: :business_delivery_areas
  has_many :opening_hours, dependent: :destroy

  accepts_nested_attributes_for :opening_hours, allow_destroy: true

  def opening_hours_to_show
    opening_hours.group_by(&:day_as_string).map do |day_as_string, opening_hours|
      opening_hours.map! do |opening_hour|
        opening_hour.opening_time.strftime('%H:%M') + ' - ' + opening_hour.closing_time.strftime('%H:%M')
      end
      [day_as_string, opening_hours.to_sentence]
    end
  end
end
