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

ActiveRecord::Schema.define(version: 20141125043827) do

  create_table "books", force: true do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.integer  "reservations"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drivers", force: true do |t|
    t.integer  "user_id"
    t.string   "car_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "license_history"
  end

  create_table "messages", force: true do |t|
    t.integer  "to_user_id"
    t.integer  "from_user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "driver_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "departure"
    t.string   "destination"
    t.datetime "leaving_time"
    t.integer  "capacity"
    t.integer  "price"
    t.integer  "driver_id"
    t.integer  "complete_flag" #募集しているか募集済みか
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userprofiles", force: true do |t|
    t.string   "name"
    t.date     "birthday"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "name"
    t.date     "birthday"
    t.string   "image"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
