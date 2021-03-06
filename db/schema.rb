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

ActiveRecord::Schema.define(version: 20141220153544) do

  create_table "books", force: true do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.integer  "reservations"
    t.integer  "status",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drivers", force: true do |t|
    t.integer  "user_id"
    t.string   "car_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "license_history"
    t.string   "time_get_license"
    t.string   "purpose"
  end

  create_table "messages", force: true do |t|
    t.integer  "receiving_id"
    t.integer  "sending_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["receiving_id", "sending_id"], name: "index_messages_on_receiving_id_and_sending_id", unique: true
  add_index "messages", ["receiving_id"], name: "index_messages_on_receiving_id"
  add_index "messages", ["sending_id"], name: "index_messages_on_sending_id"

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "read_flag",  default: 0
    t.integer  "review_id"
    t.integer  "book_id"
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
    t.integer  "complete_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "purpose"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.date     "birthday"
    t.string   "image"
    t.string   "self_introduction"
    t.string   "location"
    t.string   "school"
    t.string   "workplace"
    t.string   "sex"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
