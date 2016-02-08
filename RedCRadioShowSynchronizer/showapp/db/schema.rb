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

ActiveRecord::Schema.define(version: 20141207012542) do

  create_table "radio_shows", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "radio_shows", ["user_id"], name: "index_radio_shows_on_user_id"

  create_table "show_timings", force: true do |t|
    t.integer  "radio_show_id"
    t.string   "segment_name"
    t.string   "day"
    t.time     "startTime"
    t.time     "endTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_timings", ["radio_show_id"], name: "index_show_timings_on_radio_show_id"

  create_table "users", force: true do |t|
    t.string   "userName"
    t.string   "hostName"
    t.string   "emailAddress"
    t.string   "timeServer"
    t.string   "password"
    t.string   "location"
    t.integer  "flashTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
