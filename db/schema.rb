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

ActiveRecord::Schema.define(version: 20130731063917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: true do |t|
    t.integer  "series_id"
    t.integer  "release_id"
    t.string   "cover"
    t.string   "raw_title"
    t.string   "stock_number"
    t.string   "diamond_number"
    t.text     "description"
    t.date     "release_date"
    t.float    "price"
    t.string   "title"
    t.string   "series_title"
    t.string   "special_issue_number"
    t.integer  "issue_number"
    t.integer  "max_issue"
    t.string   "author"
    t.string   "cover_artist"
    t.string   "artist"
    t.integer  "release_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "issues", ["diamond_number"], name: "index_issues_on_diamond_number", using: :btree
  add_index "issues", ["release_id"], name: "index_issues_on_release_id", using: :btree
  add_index "issues", ["series_id"], name: "index_issues_on_series_id", using: :btree

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", force: true do |t|
  end

  create_table "series", force: true do |t|
    t.integer  "publisher_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "series", ["publisher_id"], name: "index_series_on_publisher_id", using: :btree

  create_table "variants", force: true do |t|
    t.integer  "issue_id"
    t.string   "cover"
    t.integer  "release_year"
    t.string   "diamond_number"
    t.string   "raw_title"
    t.string   "series_title"
    t.integer  "issue_number"
    t.float    "price"
    t.string   "stock_number"
    t.string   "variant_description"
    t.string   "author"
    t.string   "artist"
    t.string   "cover_artist"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variants", ["diamond_number"], name: "index_variants_on_diamond_number", using: :btree
  add_index "variants", ["issue_id"], name: "index_variants_on_issue_id", using: :btree

end
