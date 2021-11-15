# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_14_033310) do

  create_table "bookings", force: :cascade do |t|
    t.string "confirmation"
    t.integer "seats"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "base_price"
    t.string "name"
    t.string "departure"
    t.string "destination"
    t.datetime "date_time"
    t.string "status"
    t.string "email"
    t.integer "schedules_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "departure", null: false
    t.string "destination", null: false
    t.datetime "date_time", null: false
    t.integer "seats_available", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
  end

end
