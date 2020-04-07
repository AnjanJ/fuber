# frozen_string_literal: true

class Ride < ApplicationRecord
  acts_as_mappable default_units: :kms,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :destination_lat,
                   lng_column_name: :destination_lng
  belongs_to :user
  belongs_to :cab

  validates_presence_of :user, :cab

  after_save :mark_cab_on_duty, :start_ride

  SPEED = 30

  def find_nearest_cab(color = '', latitude, longitude)
    if color.present?
      Cab.where(on_duty: false, color: color).closest(origin: [latitude, longitude]).first
    else
      Cab.where(on_duty: false).closest(origin: [latitude, longitude]).first
    end
  end

  def cab?
    cab_id.present?
  end

  def mark_cab_on_duty
    cab.mark_on_duty
  end

  def calculate_distance
    distance_to(user)
  end

  def add_cost
    distance = self.distance || calculate_distance
    time = (distance / SPEED)
    if cab.pink?
      (distance * 2) + time + 5
    else
      (distance * 2) + time
    end
  end

  def start_ride
    update_columns(status: "en route")
  end

  def make_payment
    update_columns(paid: true, status: 'ride_over')
    cab.set_location(destination_lat, destination_lng)
    cab.ready_for_duty
    user.set_location(destination_lat, destination_lng)
  end
end
