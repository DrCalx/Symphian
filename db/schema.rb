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

ActiveRecord::Schema.define(version: 20150218225250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres_groups", id: false, force: true do |t|
    t.integer "genre_id", null: false
    t.integer "group_id", null: false
  end

  create_table "genres_users", id: false, force: true do |t|
    t.integer "genre_id", null: false
    t.integer "user_id",  null: false
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bio"
  end

  create_table "instruments", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listing_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "listing_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "zip"
  end

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "manager"
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id", using: :btree
  add_index "memberships", ["user_id", "group_id"], name: "index_memberships_on_user_id_and_group_id", unique: true, using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "openings", force: true do |t|
    t.integer  "group_id"
    t.integer  "instrument_id"
    t.string   "zip"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_auth_facebooks", force: true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "user_auth_facebooks", ["user_id"], name: "index_user_auth_facebooks_on_user_id", using: :btree

  create_table "user_auth_googles", force: true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.boolean  "expires"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_auth_googles", ["user_id"], name: "index_user_auth_googles_on_user_id", using: :btree

  create_table "user_auth_symphians", force: true do |t|
    t.integer  "user_id"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "user_auth_symphians", ["user_id"], name: "index_user_auth_symphians_on_user_id", using: :btree

  create_table "user_played_instruments", force: true do |t|
    t.integer  "user_id"
    t.integer  "instrument_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.text     "bio"
    t.string   "zip"
    t.integer  "soundcloud_user_id"
    t.string   "soundcloud_username"
    t.string   "soundcloud_access_token"
    t.string   "soundcloud_refresh_token"
    t.datetime "soundcloud_expires_at"
    t.boolean  "admin",                    default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "pic"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_digest"], name: "index_users_on_remember_digest", using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "youtubes", force: true do |t|
    t.string   "playlist"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "youtubes", ["user_id"], name: "index_youtubes_on_user_id", unique: true, using: :btree

end
