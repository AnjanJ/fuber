# frozen_string_literal: true

require 'test_helper'

class RideTest < ActiveSupport::TestCase
  setup do
    @ride = rides(:one)
  end

  test 'valid ride' do
    assert @ride.valid?
  end

  test 'invalid without user' do
    @ride.user = nil
    refute @ride.valid?, 'ride is invalid without a user'
    assert_not_nil @ride.errors[:user], 'must exists'
  end

  test 'invalid without cab' do
    @ride.cab = nil
    refute @ride.valid?, 'ride is invalid without a cab'
    assert_not_nil @ride.errors[:cab], 'must exists'
  end

  test 'should return true if cab assigned' do
    assert @ride.cab?, true
  end

  test 'should return false if cab is not assigned' do
    @ride.cab = nil
    refute @ride.cab?, false
  end

  test 'should calculate distance' do
    assert_equal @ride.distance_to(@ride.user), 780.1144354400016
  end

  test 'should calculate cost' do
    cab  = Cab.create(on_duty: false, lat: 1.990, lng: 2.992)
    user = User.create(email: 'e1@mail.com', lat: 10.902, lng: 9.99)
    ride = Ride.create(user: user, cab: cab, destination_lat: 14.78, destination_lng: 12.23)

    assert_equal ride.calculate_distance, 307.8408636832907
  end

  test 'should find nearest cab' do
    cab1 = Cab.create(on_duty: false, lat: 12.990, lng: 10.992)
    cab2 = Cab.create(on_duty: false, lat: 2.990, lng: 1.992)
    cab3 = Cab.create(on_duty: false, lat: 1.990, lng: 2.992)
    user = User.create(email: 'e1@mail.com', lat: 10.902, lng: 9.99)
    ride = Ride.new(user: user, destination_lat: 14.78, destination_lng: 12.23)
    cab_found = ride.find_nearest_cab('', user.lat, user.lng)

    assert_equal cab_found.id, cab1.id
  end
end
