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

ActiveRecord::Schema.define(version: 2021_11_24_154506) do

  create_table "bookings", force: :cascade do |t|
    t.string "confirmation"
    t.integer "seats"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.integer "schedule_id"
    t.integer "user_id"
    t.string "selected_seats"
    t.index ["schedule_id"], name: "index_bookings_on_schedule_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "departure"
    t.string "destination"
    t.integer "seats_available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price"
    t.date "date"
    t.time "time"
  end

  create_table "seatings", force: :cascade do |t|
    t.boolean "one", default: true
    t.boolean "two", default: true
    t.boolean "three", default: true
    t.boolean "four", default: true
    t.boolean "five", default: true
    t.boolean "six", default: true
    t.boolean "seven", default: true
    t.boolean "eight", default: true
    t.boolean "nine", default: true
    t.boolean "ten", default: true
    t.boolean "eleven", default: true
    t.boolean "twelve", default: true
    t.boolean "thirteen", default: true
    t.boolean "fourteen", default: true
    t.boolean "fifteen", default: true
    t.boolean "sixteen", default: true
    t.boolean "seventeen", default: true
    t.boolean "eighteen", default: true
    t.boolean "nineteen", default: true
    t.boolean "twenty", default: true
    t.boolean "twenty_one", default: true
    t.boolean "twenty_two", default: true
    t.boolean "twenty_three", default: true
    t.boolean "twenty_four", default: true
    t.boolean "twenty_five", default: true
    t.boolean "twenty_six", default: true
    t.boolean "twenty_seven", default: true
    t.boolean "twenty_eight", default: true
    t.boolean "twenty_nine", default: true
    t.boolean "thirty", default: true
    t.boolean "thirty_one", default: true
    t.boolean "thirty_two", default: true
    t.boolean "thirty_three", default: true
    t.boolean "thirty_four", default: true
    t.boolean "thirty_five", default: true
    t.boolean "thirty_six", default: true
    t.boolean "thirty_seven", default: true
    t.boolean "thirty_eight", default: true
    t.boolean "thirty_nine", default: true
    t.boolean "forty", default: true
    t.boolean "forty_one", default: true
    t.boolean "forty_two", default: true
    t.boolean "forty_three", default: true
    t.boolean "forty_four", default: true
    t.boolean "forty_five", default: true
    t.boolean "forty_six", default: true
    t.boolean "forty_seven", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "schedule_id"
    t.index ["schedule_id"], name: "index_seatings_on_schedule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  add_foreign_key "bookings", "schedules"
  add_foreign_key "bookings", "users"
  add_foreign_key "seatings", "schedules"
end
