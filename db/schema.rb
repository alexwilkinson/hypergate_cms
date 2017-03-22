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

ActiveRecord::Schema.define(version: 20170322003844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "away_mission_responses", force: :cascade do |t|
    t.integer  "mission_id"
    t.integer  "role_id",         null: false
    t.integer  "away_mission_id", null: false
    t.text     "response",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "away_mission_responses", ["away_mission_id"], name: "index_away_mission_responses_on_away_mission_id", using: :btree
  add_index "away_mission_responses", ["mission_id"], name: "index_away_mission_responses_on_mission_id", using: :btree
  add_index "away_mission_responses", ["role_id"], name: "index_away_mission_responses_on_role_id", using: :btree

  create_table "away_missions", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combat_obstacles", force: :cascade do |t|
    t.integer  "mission_id",              null: false
    t.text     "description",             null: false
    t.integer  "enemy_count", default: 1, null: false
    t.integer  "order",       default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "combat_obstacles", ["mission_id"], name: "index_combat_obstacles_on_mission_id", using: :btree

  create_table "effects", force: :cascade do |t|
    t.boolean  "base_effect",   default: true,  null: false
    t.boolean  "mining_bay",    default: false, null: false
    t.boolean  "cargo_bay",     default: false, null: false
    t.boolean  "repair_bay",    default: false, null: false
    t.boolean  "battery",       default: false, null: false
    t.boolean  "defense_droid", default: false, null: false
    t.boolean  "astrometrics",  default: false, null: false
    t.boolean  "ship_computer", default: false, null: false
    t.integer  "outcome_id",                    null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "effects", ["outcome_id"], name: "index_effects_on_outcome_id", using: :btree

  create_table "encounters", force: :cascade do |t|
    t.integer  "category_id",                      null: false
    t.string   "description",                      null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "starting_event_id",                null: false
    t.boolean  "standalone",        default: true, null: false
  end

  create_table "events", force: :cascade do |t|
    t.text     "description",       null: false
    t.integer  "encounter_id",      null: false
    t.integer  "next_encounter_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "events", ["encounter_id"], name: "index_events_on_encounter_id", using: :btree
  add_index "events", ["next_encounter_id"], name: "index_events_on_next_encounter_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["role_id"], name: "index_items_on_role_id", using: :btree

  create_table "missions", force: :cascade do |t|
    t.text     "failure_text", null: false
    t.integer  "outcome_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "missions", ["outcome_id"], name: "index_missions_on_outcome_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.text     "text",               null: false
    t.integer  "order",              null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "event_id",           null: false
    t.integer  "success_event_id",   null: false
    t.integer  "failure_event_id"
    t.integer  "required_role_id"
    t.integer  "required_module_id"
    t.integer  "required_item_id"
  end

  add_index "options", ["event_id"], name: "index_options_on_event_id", using: :btree

  create_table "outcomes", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.integer  "credits",          default: 0,     null: false
    t.integer  "ellerium",         default: 0,     null: false
    t.integer  "wilkinide",        default: 0,     null: false
    t.integer  "galacite",         default: 0,     null: false
    t.integer  "plasma_cells",     default: 0,     null: false
    t.integer  "scrap_metal",      default: 0,     null: false
    t.integer  "medical_supplies", default: 0,     null: false
    t.boolean  "refugees",         default: false, null: false
    t.integer  "option_id",                        null: false
    t.boolean  "mining_bay",       default: false, null: false
    t.boolean  "cargo_bay",        default: false, null: false
    t.boolean  "repair_bay",       default: false, null: false
    t.boolean  "battery",          default: false, null: false
    t.boolean  "defense_droid",    default: false, null: false
    t.boolean  "astrometrics",     default: false, null: false
    t.boolean  "ship_computer",    default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "requirements", ["option_id"], name: "index_requirements_on_option_id", using: :btree

  create_table "response_skill_checks", force: :cascade do |t|
    t.text     "success_text"
    t.text     "failure_text"
    t.integer  "response_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "option_id",    null: false
  end

  add_index "response_skill_checks", ["option_id"], name: "index_response_skill_checks_on_option_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.string   "text"
    t.integer  "role_id"
    t.integer  "encounter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roll_effect_pairs", force: :cascade do |t|
    t.numrange "roll_range"
    t.integer  "roll"
    t.string   "upgrades",                                      array: true
    t.integer  "credits",          default: 0,     null: false
    t.integer  "ellerium",         default: 0,     null: false
    t.integer  "wilkinide",        default: 0,     null: false
    t.integer  "galacite",         default: 0,     null: false
    t.integer  "plasma_cells",     default: 0,     null: false
    t.integer  "scrap_metal",      default: 0,     null: false
    t.integer  "medical_supplies", default: 0,     null: false
    t.boolean  "refugees",         default: false, null: false
    t.integer  "effect_id",                        null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "roll_effect_pairs", ["effect_id"], name: "index_roll_effect_pairs_on_effect_id", using: :btree
  add_index "roll_effect_pairs", ["upgrades"], name: "index_roll_effect_pairs_on_upgrades", using: :gin

  create_table "ship_modules", force: :cascade do |t|
    t.string   "name",                            null: false
    t.boolean  "starting_module", default: false, null: false
    t.integer  "role_id",                         null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "ship_modules", ["role_id"], name: "index_ship_modules_on_role_id", using: :btree

  create_table "skill_check_obstacles", force: :cascade do |t|
    t.integer  "order",       default: 1, null: false
    t.text     "description",             null: false
    t.integer  "mission_id",              null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "skill_check_obstacles", ["mission_id"], name: "index_skill_check_obstacles_on_mission_id", using: :btree

  create_table "skill_checks", force: :cascade do |t|
    t.integer  "role_id",     null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "difficulty",  null: false
  end

  add_index "skill_checks", ["role_id"], name: "index_skill_checks_on_role_id", using: :btree

  add_foreign_key "away_mission_responses", "away_missions"
  add_foreign_key "away_mission_responses", "missions"
  add_foreign_key "away_mission_responses", "roles"
  add_foreign_key "combat_obstacles", "missions"
  add_foreign_key "effects", "outcomes"
  add_foreign_key "encounters", "events", column: "starting_event_id"
  add_foreign_key "events", "encounters"
  add_foreign_key "events", "encounters", column: "next_encounter_id"
  add_foreign_key "items", "roles"
  add_foreign_key "missions", "outcomes"
  add_foreign_key "options", "events"
  add_foreign_key "options", "events", column: "failure_event_id"
  add_foreign_key "options", "events", column: "success_event_id"
  add_foreign_key "options", "items", column: "required_item_id"
  add_foreign_key "options", "roles", column: "required_role_id"
  add_foreign_key "options", "ship_modules", column: "required_module_id"
  add_foreign_key "requirements", "options"
  add_foreign_key "response_skill_checks", "options"
  add_foreign_key "roll_effect_pairs", "effects"
  add_foreign_key "ship_modules", "roles"
  add_foreign_key "skill_check_obstacles", "missions"
  add_foreign_key "skill_checks", "roles"
end
