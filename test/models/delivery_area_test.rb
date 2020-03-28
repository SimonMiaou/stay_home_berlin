# frozen_string_literal: true

require 'test_helper'

class DeliveryAreaTest < ActiveSupport::TestCase
  test 'postcode validation' do
    # postcode need to be 5 characters long
    # it can only be composed of digits or x at the end

    delivery_area = DeliveryArea.new(name: 'Berlin', postcode: '10317')
    assert delivery_area.valid?, '10317 is valid'

    delivery_area = DeliveryArea.new(name: 'Berlin', postcode: '1031x')
    assert delivery_area.valid?, '1031x is valid'

    delivery_area = DeliveryArea.new(name: 'Berlin', postcode: '10xxx')
    assert delivery_area.valid?, '10xxx is valid'

    delivery_area = DeliveryArea.new(name: 'Berlin', postcode: '1031.')
    assert_not delivery_area.valid?, '1031. is not valid'

    delivery_area = DeliveryArea.new(name: 'Berlin', postcode: '103x7')
    assert_not delivery_area.valid?, '103x7 is not valid'

    delivery_area = DeliveryArea.new(name: 'Berlin', postcode: 'xxxxxxx')
    assert_not delivery_area.valid?, 'xxxxxxx is not valid'

    delivery_area = DeliveryArea.new(name: 'Berlin', postcode: 'foo')
    assert_not delivery_area.valid?, 'foo is not valid'
  end
end
