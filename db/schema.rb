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

ActiveRecord::Schema.define(version: 20131216092912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "covers", force: true do |t|
    t.integer "issue_id"
    t.string  "image"
    t.string  "homing_string"
    t.string  "cover_artist"
    t.string  "diamond_number"
  end

  create_table "diamond_items", force: true do |t|
    t.string  "diamond_number"
    t.boolean "valid_diamond_number"
  end

  create_table "issues", force: true do |t|
    t.integer  "series_id"
    t.integer  "release_id"
    t.string   "raw_title"
    t.string   "stock_number"
    t.string   "diamond_number"
    t.text     "description"
    t.float    "price"
    t.string   "title"
    t.string   "special_issue_number"
    t.integer  "issue_number"
    t.integer  "max_issue"
    t.string   "author"
    t.string   "artist"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "homing_string"
  end

  add_index "issues", ["diamond_number"], name: "index_issues_on_diamond_number", using: :btree
  add_index "issues", ["release_id"], name: "index_issues_on_release_id", using: :btree
  add_index "issues", ["series_id"], name: "index_issues_on_series_id", using: :btree

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pull_lists", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pull_lists", ["user_id"], name: "index_pull_lists_on_user_id", using: :btree

  create_table "pulls", force: true do |t|
    t.integer  "series_id"
    t.integer  "pull_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pulls", ["pull_list_id"], name: "index_pulls_on_pull_list_id", using: :btree
  add_index "pulls", ["series_id"], name: "index_pulls_on_series_id", using: :btree

  create_table "releases", force: true do |t|
    t.date "date"
  end

  create_table "series", force: true do |t|
    t.integer  "publisher_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "series", ["publisher_id"], name: "index_series_on_publisher_id", using: :btree

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
    t.string   "username"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
