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

ActiveRecord::Schema[7.0].define(version: 2022_03_22_040454) do
  create_table "entrants", force: :cascade do |t|
    t.integer "tournament_id", null: false
    t.string "userid"
    t.string "name"
    t.string "player_number"
    t.integer "rating"
    t.string "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_entrants_on_tournament_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "userid"
    t.string "name"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer "tournament_id", null: false
    t.integer "entrant_id", null: false
    t.string "division"
    t.string "round"
    t.integer "opponent_id", null: false
    t.integer "score"
    t.integer "opponent_score"
    t.boolean "first"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrant_id"], name: "index_results_on_entrant_id"
    t.index ["opponent_id"], name: "index_results_on_opponent_id"
    t.index ["tournament_id"], name: "index_results_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entrants", "tournaments"
  add_foreign_key "results", "entrants"
  add_foreign_key "results", "entrants", column: "opponent_id"
  add_foreign_key "results", "tournaments"
end
