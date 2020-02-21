# frozen_string_literal: true

require 'test_helper'

class RidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ride = rides(:one)
  end

  test 'should get index' do
    get rides_url, as: :json
    assert_response :success
  end

  test 'should create ride' do
    assert_difference('Ride.count') do
      post rides_url, params: { ride: { cab_id: @ride.cab_id, cost: @ride.cost, destination_lat: @ride.destination_lat, destination_lng: @ride.destination_lng, distance: @ride.distance, paid: @ride.paid, status: @ride.status, user_id: @ride.user_id } }, as: :json
    end

    assert_response 201
  end

  test 'should show ride' do
    get ride_url(@ride), as: :json
    assert_response :success
  end

  test 'should update ride' do
    patch ride_url(@ride), params: { ride: { cab_id: @ride.cab_id, cost: @ride.cost, destination_lat: @ride.destination_lat, destination_lng: @ride.destination_lng, distance: @ride.distance, paid: @ride.paid, status: @ride.status, user_id: @ride.user_id } }, as: :json
    assert_response 200
  end

  test 'should destroy ride' do
    assert_difference('Ride.count', -1) do
      delete ride_url(@ride), as: :json
    end

    assert_response 204
  end
end
