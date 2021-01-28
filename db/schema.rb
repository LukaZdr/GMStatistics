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

ActiveRecord::Schema.define(version: 2021_01_27_181356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_sessions", force: :cascade do |t|
    t.bigint "map_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_game_sessions_on_map_id"
  end

  create_table "login_times", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "time"
    t.index ["user_id"], name: "index_login_times_on_user_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
  end

  create_table "rounds", force: :cascade do |t|
    t.boolean "innocent_win"
    t.bigint "game_session_id"
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

end
