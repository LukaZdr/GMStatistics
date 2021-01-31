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

ActiveRecord::Schema.define(version: 2021_01_31_141017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_sessions", force: :cascade do |t|
    t.bigint "map_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_game_sessions_on_map_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "item_slot"
    t.string "ammo_type"
  end

  create_table "login_times", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "logout"
    t.datetime "login"
    t.string "logout_reason"
    t.index ["user_id"], name: "index_login_times_on_user_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
  end

  create_table "ping_samples", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "ping"
    t.datetime "created_at", null: false
    t.index ["user_id"], name: "index_ping_samples_on_user_id"
  end

  create_table "round_participants", force: :cascade do |t|
    t.bigint "round_id"
    t.bigint "user_id"
    t.string "role"
    t.integer "karma"
    t.integer "score"
    t.boolean "survived"
    t.integer "credits"
    t.index ["round_id"], name: "index_round_participants_on_round_id"
    t.index ["user_id"], name: "index_round_participants_on_user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "game_session_id"
    t.string "win_reason"
    t.index ["game_session_id"], name: "index_rounds_on_game_session_id"
  end

  create_table "server_starts", force: :cascade do |t|
    t.datetime "time"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "steam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ping_samples", "users"
  add_foreign_key "round_participants", "rounds"
  add_foreign_key "round_participants", "users"
end
