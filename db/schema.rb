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

ActiveRecord::Schema.define(version: 20131116190211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "url"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "key_distances", force: true do |t|
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "key_location_id"
    t.float    "bike_distance"
    t.text     "bike_directions"
    t.time     "bike_time"
    t.float    "walk_distance"
    t.text     "walk_directions"
    t.float    "walk_time"
    t.float    "transit_distance"
    t.text     "transit_directions"
    t.time     "transit_time"
    t.float    "drive_distance"
    t.text     "drive_directions"
    t.time     "drive_time"
    t.float    "distance_between"
  end

  add_index "key_distances", ["location_id", "key_location_id"], name: "index_key_distances_on_location_id_and_key_location_id", unique: true, using: :btree

  create_table "locations", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "beds"
    t.float    "baths"
    t.integer  "price"
    t.string   "phone"
    t.string   "name"
    t.text     "notes"
    t.string   "neighborhood"
    t.integer  "taxes"
    t.string   "link"
    t.integer  "user_id"
    t.boolean  "is_key"
    t.integer  "group_id"
  end

  add_index "locations", ["group_id"], name: "index_locations_on_group_id", using: :btree
  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "roles",                  default: "--- []"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
