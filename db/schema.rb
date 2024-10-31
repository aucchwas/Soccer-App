# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_31_114529) do
  create_table "leagues", force: :cascade do |t|
    t.integer "custom_id"
    t.string "league_name"
    t.string "league_type"
    t.string "country_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "number"
    t.string "position"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.integer "points"
    t.integer "goal_diff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "league_id", null: false
    t.integer "team_id"
    t.integer "actual_id"
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

  add_foreign_key "players", "teams"
  add_foreign_key "teams", "leagues"
end
