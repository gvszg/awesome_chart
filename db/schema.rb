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

ActiveRecord::Schema.define(version: 20160214111728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "status",     default: 0
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
    t.datetime "created_on"
  end

  add_index "categories", ["deleted_at"], name: "index_categories_on_deleted_at", using: :btree

  create_table "comments", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "key"
    t.integer  "status",     default: 0
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "created_on"
  end

  add_index "comments", ["deleted_at"], name: "index_comments_on_deleted_at", using: :btree

  create_table "post_categories", force: true do |t|
    t.integer  "post_id"
    t.integer  "category_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "created_on"
  end

  add_index "post_categories", ["category_id"], name: "index_post_categories_on_category_id", using: :btree
  add_index "post_categories", ["deleted_at"], name: "index_post_categories_on_deleted_at", using: :btree
  add_index "post_categories", ["post_id"], name: "index_post_categories_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "manager_id"
    t.integer  "status",      default: 0
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
    t.datetime "created_on"
  end

  add_index "posts", ["deleted_at"], name: "index_posts_on_deleted_at", using: :btree
  add_index "posts", ["manager_id"], name: "index_posts_on_manager_id", using: :btree

  create_table "subscribes", force: true do |t|
    t.string   "email",      null: false
    t.integer  "amount",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "created_on"
  end

end
