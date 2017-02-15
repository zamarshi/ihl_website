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

ActiveRecord::Schema.define(version: 20170214235225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assists", force: :cascade do |t|
    t.integer  "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
    t.index ["goal_id"], name: "index_assists_on_goal_id", using: :btree
    t.index ["player_id"], name: "index_assists_on_player_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.integer  "season_id"
    t.datetime "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.string   "aasm_state"
    t.index ["season_id"], name: "index_games_on_season_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
    t.index ["game_id"], name: "index_goals_on_game_id", using: :btree
    t.index ["player_id"], name: "index_goals_on_player_id", using: :btree
    t.index ["team_id"], name: "index_goals_on_team_id", using: :btree
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
    t.integer  "game_id"
    t.index ["game_id"], name: "index_player_games_on_game_id", using: :btree
    t.index ["player_id"], name: "index_player_games_on_player_id", using: :btree
  end

  create_table "player_seasons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
    t.integer  "season_id"
    t.index ["player_id"], name: "index_player_seasons_on_player_id", using: :btree
    t.index ["season_id"], name: "index_player_seasons_on_season_id", using: :btree
  end

  create_table "player_teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
    t.integer  "team_id"
    t.index ["player_id"], name: "index_player_teams_on_player_id", using: :btree
    t.index ["team_id"], name: "index_player_teams_on_team_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.datetime "date_of_birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "current_season", default: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "season_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["season_id"], name: "index_teams_on_season_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "assists", "goals"
  add_foreign_key "assists", "players"
  add_foreign_key "games", "seasons"
  add_foreign_key "goals", "games"
  add_foreign_key "goals", "players"
  add_foreign_key "goals", "teams"
  add_foreign_key "player_games", "games"
  add_foreign_key "player_games", "players"
  add_foreign_key "player_seasons", "players"
  add_foreign_key "player_seasons", "seasons"
  add_foreign_key "player_teams", "players"
  add_foreign_key "player_teams", "teams"
  add_foreign_key "teams", "seasons"
end
