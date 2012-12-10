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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121210123934) do

  create_table "issues", :force => true do |t|
    t.integer  "release_id"
    t.integer  "series_id"
    t.string   "title"
    t.text     "description"
    t.string   "diamond_no"
    t.string   "stock_no"
    t.string   "writer"
    t.string   "artist"
    t.string   "cover_artist"
    t.integer  "issue_no"
    t.integer  "max_issue"
    t.float    "price"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "cover_url"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.boolean  "has_cover",          :default => false
  end

  create_table "listings", :force => true do |t|
    t.text     "diamd_no"
    t.text     "stock_no"
    t.text     "parent_item_no_alt"
    t.text     "bounce_use_item"
    t.text     "full_title"
    t.text     "full_desc"
    t.text     "main_desc"
    t.text     "variant_desc"
    t.text     "series_code"
    t.text     "issue_no"
    t.text     "issue_seq_no"
    t.text     "volume_tag"
    t.text     "max_issue"
    t.text     "publisher"
    t.text     "upc_no"
    t.text     "isbn_no"
    t.text     "ean_no"
    t.text     "cards_per_pack"
    t.text     "pack_per_box"
    t.text     "box_per_case"
    t.text     "discount_code"
    t.text     "increment_no"
    t.text     "prnt_date"
    t.text     "foc_vendor"
    t.text     "ship_date"
    t.text     "srp"
    t.text     "short_isbn_no"
    t.text     "category"
    t.text     "genre"
    t.text     "brand_code"
    t.text     "mature"
    t.text     "adult"
    t.text     "oa"
    t.text     "caut1"
    t.text     "caut2"
    t.text     "caut3"
    t.text     "resol"
    t.text     "price"
    t.text     "note_price"
    t.text     "order_form_notes"
    t.text     "page"
    t.text     "writer"
    t.text     "artist"
    t.text     "cover_artist"
    t.integer  "preview_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "previews", :force => true do |t|
    t.string   "first_diamd_no"
    t.string   "last_diamd_no"
    t.boolean  "digested",       :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pulls", :force => true do |t|
    t.integer  "series_id"
    t.integer  "list_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "releases", :force => true do |t|
    t.date     "ship_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "series", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "publisher_id"
  end

  create_table "stores", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "variants", :force => true do |t|
    t.integer  "issue_id"
    t.string   "diamond_no"
    t.string   "title"
    t.text     "description"
    t.string   "stock_no"
    t.string   "writer"
    t.string   "artist"
    t.string   "cover_artist"
    t.integer  "issue_no"
    t.integer  "max_issue"
    t.float    "price"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "cover_url"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.boolean  "has_cover",          :default => false
  end

end
