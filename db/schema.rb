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

ActiveRecord::Schema.define(version: 20150806223153) do

  create_table "companies", force: :cascade do |t|
    t.integer  "predecessor_id",       limit: 4
    t.integer  "principal_company_id", limit: 4
    t.string   "name",                 limit: 255
    t.string   "city",                 limit: 255
    t.string   "state",                limit: 255
    t.string   "country",              limit: 255
    t.date     "established_on"
    t.string   "company_type",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_releases", force: :cascade do |t|
    t.integer  "company_id",           limit: 4
    t.integer  "release_id",           limit: 4
    t.string   "company_release_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.decimal  "total_rating",                precision: 4, scale: 2
    t.decimal  "possible_rating",             precision: 4, scale: 2, default: 5.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms", force: :cascade do |t|
    t.integer  "producer_id", limit: 4
    t.string   "name",        limit: 255
    t.date     "released_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", force: :cascade do |t|
    t.integer  "game_id",     limit: 4
    t.integer  "platform_id", limit: 4
    t.string   "name",        limit: 255
    t.string   "market",      limit: 255
    t.date     "released_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
