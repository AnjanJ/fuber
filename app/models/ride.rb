# frozen_string_literal: true

class Ride < ApplicationRecord
  acts_as_mappable default_units: :kms,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :destination_lat,
                   lng_column_name: :destination_lng
  belongs_to :user
  belongs_to :cab
end
