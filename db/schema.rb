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

ActiveRecord::Schema.define(version: 20160817210107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.string   "status"
    t.integer  "first_player_id"
    t.integer  "second_player_id"
    t.integer  "tournament_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "matches", ["tournament_id"], name: "index_matches_on_tournament_id", using: :btree

  create_table "player_infos", force: :cascade do |t|
    t.integer  "currentPoints"
    t.string   "team"
    t.integer  "tournament_id"
    t.integer  "player_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "player_infos", ["player_id"], name: "index_player_infos_on_player_id", using: :btree
  add_index "player_infos", ["tournament_id"], name: "index_player_infos_on_tournament_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.integer  "minPlayers"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
