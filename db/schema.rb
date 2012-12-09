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

ActiveRecord::Schema.define(:version => 20121209201806) do

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
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "cover_url"
  end

  create_table "listings", :force => true do |t|
    t.string   "diamd_no"
    t.string   "stock_no"
    t.string   "parent_item_no_alt"
    t.string   "bounce_use_item"
    t.string   "full_title"
    t.string   "full_desc"
    t.string   "main_desc"
    t.string   "variant_desc"
    t.string   "series_code"
    t.string   "issue_no"
    t.string   "issue_seq_no"
    t.string   "volume_tag"
    t.string   "max_issue"
    t.string   "publisher"
    t.string   "upc_no"
    t.string   "isbn_no"
    t.string   "ean_no"
    t.string   "cards_per_pack"
    t.string   "pack_per_box"
    t.string   "box_per_case"
    t.string   "discount_code"
    t.string   "increment_no"
    t.string   "prnt_date"
    t.string   "foc_vendor"
    t.string   "ship_date"
    t.string   "srp"
    t.string   "short_isbn_no"
    t.string   "category"
    t.string   "genre"
    t.string   "brand_code"
    t.string   "mature"
    t.string   "adult"
    t.string   "oa"
    t.string   "caut1"
    t.string   "caut2"
    t.string   "caut3"
    t.string   "resol"
    t.string   "price"
    t.string   "note_price"
    t.text     "order_form_notes"
    t.string   "page"
    t.string   "writer"
    t.string   "artist"
    t.string   "cover_artist"
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
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "cover_url"
  end

end
