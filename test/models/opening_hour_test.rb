# frozen_string_literal: true

require 'test_helper'

class OpeningHourTest < ActiveSupport::TestCase
  test 'day_number validation' do
    business = Business.create!(name: 'Foo')

    opening_hour = OpeningHour.new(business: business, day_number: 0)
    assert opening_hour.valid?, '0 is valid'

    opening_hour = OpeningHour.new(business: business, day_number: 1)
    assert opening_hour.valid?, '1 is valid'

    opening_hour = OpeningHour.new(business: business, day_number: 2)
    assert opening_hour.valid?, '2 is valid'

    opening_hour = OpeningHour.new(business: business, day_number: 3)
    assert opening_hour.valid?, '3 is valid'

    opening_hour = OpeningHour.new(business: business, day_number: 4)
    assert opening_hour.valid?, '4 is valid'

    opening_hour = OpeningHour.new(business: business, day_number: 5)
    assert opening_hour.valid?, '5 is valid'

    opening_hour = OpeningHour.new(business: business, day_number: 6)
    assert opening_hour.valid?, '6 is valid'

    opening_hour = OpeningHour.new(business: business, day_number: 7)
    assert_not opening_hour.valid?, '7 is no valid'

    opening_hour = OpeningHour.new(business: business, day_number: -1)
    assert_not opening_hour.valid?, 'negative numbers are not valid'
  end
end
