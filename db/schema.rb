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

ActiveRecord::Schema.define(version: 20200428014340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "listing_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "bookings", ["listing_id"], name: "index_bookings_on_listing_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "address",                              null: false
    t.string   "zipcode",                              null: false
    t.decimal  "daily_price",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                                 null: false
    t.string   "city",                                 null: false
    t.string   "state",                                null: false
    t.decimal  "size",                                 null: false
    t.integer  "customer_id"
    t.json     "images"
    t.decimal  "lat",         precision: 15, scale: 8, null: false
    t.decimal  "lon",         precision: 15, scale: 8, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "rating",      precision: 3, scale: 1, null: false
    t.text     "comments"
    t.integer  "customer_id",                         null: false
    t.integer  "listing_id",                          null: false
    t.boolean  "anonymous"
  end

  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "listings"
  add_foreign_key "listings", "customers"
end
