# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lats = [
  19.076090,
  18.9244,
  18.9404,
  18.910000,
  19.073212,
  19.0760,
  12.120000,
  24.879999,
  16.994444,
  19.155001,
  24.794500,
  21.250000,
  16.166700,
  26.850000,
  28.610001
]

lngs = [
  72.877426,
  72.8324,
  72.8339,
  72.809998,
  72.854195,
  72.8777,
  76.680000,
  74.629997,
  73.300003,
  72.849998,
  73.055000,
  81.629997,
  74.833298,
  80.949997,
  77.230003
]

15.times do |no|
  User.find_or_create_by(
    email: "#{no}user@a.com",
    lat: lats[no],
    lng: lats[no]
  )
end

location_picker = 1
60.times do |no|
  while Cab.all.size < 60
    Cab.create(
      color: no.odd? ? 'pink' : '',
      on_duty: false,
      lat: no > 15 ? lats[location_picker] + 0.002300 : lats[location_picker],
      lng: no > 15 ? lngs[location_picker] + 0.015000 : lngs[location_picker]
    )
  end
  location_picker = 1 if location_picker >= 15
end
