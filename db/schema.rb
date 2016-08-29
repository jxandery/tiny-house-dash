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

ActiveRecord::Schema.define(version: 20160826212239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_story_id"
  end

  add_index "categories", ["user_story_id"], name: "index_categories_on_user_story_id", using: :btree

  create_table "coach_clients", force: :cascade do |t|
    t.integer  "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "client_id"
    t.date     "start_date"
    t.date     "end_date"
  end

  add_index "coach_clients", ["client_id"], name: "index_coach_clients_on_client_id", using: :btree
  add_index "coach_clients", ["coach_id", "client_id"], name: "index_coach_clients_on_coach_id_and_client_id", unique: true, using: :btree
  add_index "coach_clients", ["coach_id"], name: "index_coach_clients_on_coach_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree

  create_table "user_stories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "username"
    t.boolean  "admin",           default: false
  end

  add_foreign_key "categories", "user_stories"
  add_foreign_key "items", "categories"
end
