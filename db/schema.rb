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

ActiveRecord::Schema.define(version: 20150410183503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "review_id",  null: false
    t.integer  "user_id",    null: false
    t.text     "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "downvotes", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "review_id",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "vote",       default: false
  end

  add_index "downvotes", ["user_id", "review_id"], name: "index_downvotes_on_user_id_and_review_id", unique: true, using: :btree

  create_table "game_tags", force: :cascade do |t|
    t.integer "tag_id",  null: false
    t.integer "game_id", null: false
  end

  add_index "game_tags", ["tag_id", "game_id"], name: "index_game_tags_on_tag_id_and_game_id", unique: true, using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "name",                       null: false
    t.text     "description",                null: false
    t.integer  "min_players",                null: false
    t.integer  "max_players",                null: false
    t.string   "designer"
    t.date     "release_date"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "playing_time"
    t.integer  "complexity"
    t.integer  "user_id",                    null: false
    t.string   "photo"
    t.float    "average",      default: 0.0, null: false
    t.string   "amazon_html"
  end

  add_index "games", ["average"], name: "index_games_on_average", using: :btree
  add_index "games", ["name"], name: "index_games_on_name", unique: true, using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.text     "body",                    null: false
    t.integer  "game_rating"
    t.integer  "game_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vote_count",  default: 0
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "upvotes", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "review_id",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "vote",       default: false
  end

  add_index "upvotes", ["user_id", "review_id"], name: "index_upvotes_on_user_id_and_review_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                                null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "age"
    t.string   "location"
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_photo"
    t.string   "authority",              default: "user", null: false
    t.integer  "level",                  default: 0
    t.integer  "xp",                     default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "identities", "users"
end
