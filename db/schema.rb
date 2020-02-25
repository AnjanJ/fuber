# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_21_140146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabs", force: :cascade do |t|
    t.string "color"
    t.boolean "on_duty", null: false
    t.decimal "lat", null: false
    t.decimal "lng", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rides", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cab_id", null: false
    t.string "status"
    t.decimal "destination_lat"
    t.decimal "destination_lng"
    t.decimal "distance"
    t.decimal "cost"
    t.boolean "paid", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cab_id"], name: "index_rides_on_cab_id"
    t.index ["user_id"], name: "index_rides_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.decimal "lat"
    t.decimal "lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "rides", "cabs"
  add_foreign_key "rides", "users"
end
