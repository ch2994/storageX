# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200305161350) do

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "user"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookings", ["listing_id"], name: "index_bookings_on_listing_id"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.string   "phone",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "username",   null: false
    t.string   "password",   null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "address",     null: false
    t.string   "zipcode",     null: false
    t.string   "daily_price", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",        null: false
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.string   "size",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "userid"
    t.string "password"
  end

end
