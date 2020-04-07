# frozen_string_literal: true

class Cab < ApplicationRecord
  acts_as_mappable default_units: :kms,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :lat,
                   lng_column_name: :lng
  has_many :rides

  def mark_on_duty;update(on_duty: true);end

  def ready_for_duty
    update(on_duty: false)
  end

  def set_location(latitude, longitutde)
    update_columns(lat: latitude, lng: longitutde)
  end

  def pink?
    color == "pink"
  end
end
