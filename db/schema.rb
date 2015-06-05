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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dim_dates", id: :bigserial, force: :cascade do |t|
    t.text "date_id"
  end

  add_index "dim_dates", ["date_id"], name: "idx_date_date_id", using: :btree

  create_table "dim_keywords", id: false, force: :cascade do |t|
    t.text "title"
    t.text "type"
    t.text "title_alphanumeric"
  end

  add_index "dim_keywords", ["title"], name: "idx_dim_keyword_keyword", using: :btree
  add_index "dim_keywords", ["title"], name: "uniq_title_keyword", unique: true, using: :btree
  add_index "dim_keywords", ["type"], name: "idx_dim_keyword_type", using: :btree

  create_table "fac_keyword_count", id: :bigserial, force: :cascade do |t|
    t.text    "keyword"
    t.text    "date_id"
    t.integer "count",   limit: 8
  end

  add_index "fac_keyword_count", ["date_id"], name: "idx_keyword_date_id", using: :btree
  add_index "fac_keyword_count", ["id"], name: "idx_keyword_ids", unique: true, using: :btree
  add_index "fac_keyword_count", ["keyword"], name: "idx_keyword_keyworrd", using: :btree

  create_table "fac_keyword_items", id: :bigserial, force: :cascade do |t|
    t.integer "item_id", limit: 8
    t.text    "keyword"
  end

  add_index "fac_keyword_items", ["id"], name: "idx_bri_keyword_id", using: :btree
  add_index "fac_keyword_items", ["item_id"], name: "idx_bri_keyword_item_id", using: :btree
  add_index "fac_keyword_items", ["keyword"], name: "idx_bri_keyword_keyword", using: :btree

  create_table "fac_keyword_users", id: :bigserial, force: :cascade do |t|
    t.integer "user_id", limit: 8
    t.text    "keyword"
  end

  add_index "fac_keyword_users", ["id"], name: "idx_bri_keyword__id", using: :btree
  add_index "fac_keyword_users", ["keyword"], name: "idx_bri_keyword__keyword", using: :btree
  add_index "fac_keyword_users", ["user_id"], name: "idx_bri_keyword__user_id", using: :btree

  create_table "fac_query", id: :bigserial, force: :cascade do |t|
    t.text    "keyword"
    t.text    "ip_address"
    t.integer "created",    limit: 8
  end

  create_table "sta_items", id: :bigserial, force: :cascade do |t|
    t.string  "type",        limit: 25
    t.string  "by",          limit: 25
    t.integer "time",        limit: 8
    t.text    "text"
    t.integer "parent",      limit: 8
    t.text    "kids"
    t.text    "url"
    t.integer "score",       limit: 8
    t.text    "title"
    t.text    "parts"
    t.text    "descendants"
    t.integer "updated",     limit: 8
    t.boolean "deleted"
    t.boolean "dead"
  end

  add_index "sta_items", ["id"], name: "idx_sta_items_id", using: :btree

  create_table "sta_queue", id: false, force: :cascade do |t|
    t.integer "id",       limit: 8
    t.string  "type",     limit: 50
    t.integer "sid",      limit: 8
    t.integer "bucket",   limit: 8
    t.text    "sid_text"
  end

  add_index "sta_queue", ["bucket"], name: "idx_sta_queue_bucket", using: :btree
  add_index "sta_queue", ["id"], name: "idx_sta_queue_id", using: :btree
  add_index "sta_queue", ["type"], name: "idx_sta_queue_type", using: :btree

  create_table "sta_responses", id: false, force: :cascade do |t|
    t.integer "id",          limit: 8
    t.text    "url"
    t.text    "response"
    t.string  "type",        limit: 10
    t.integer "updated",     limit: 8
    t.string  "request_for", limit: 10
    t.integer "created",     limit: 8
    t.string  "by",          limit: 100
  end

  add_index "sta_responses", ["id"], name: "idx_id", unique: true, using: :btree
  add_index "sta_responses", ["type"], name: "idx_responses_type", using: :btree

  create_table "sta_users", force: :cascade do |t|
    t.integer "created",   limit: 8
    t.integer "delay",     limit: 8
    t.text    "about"
    t.integer "karma",     limit: 8
    t.text    "submitted"
    t.integer "updated",   limit: 8
    t.string  "name",      limit: 100
  end

end
