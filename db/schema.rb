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

ActiveRecord::Schema.define(version: 20160615193901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer  "category_id",   null: false
    t.integer  "sector",        null: false
    t.string   "grid_position", null: false
    t.string   "description",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "missions", force: :cascade do |t|
    t.text     "failure_text", null: false
    t.text     "description",  null: false
    t.integer  "outcome_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "missions", ["outcome_id"], name: "index_missions_on_outcome_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.integer  "encounter_id", null: false
    t.text     "text",         null: false
    t.integer  "order",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "result_id",    null: false
    t.string   "result_type",  null: false
  end

  add_index "options", ["result_type", "result_id"], name: "index_options_on_result_type_and_result_id", using: :btree

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
    t.integer  "result_id",    null: false
    t.integer  "response_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "option_id",    null: false
  end

  add_index "response_skill_checks", ["option_id"], name: "index_response_skill_checks_on_option_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.string   "text",                    null: false
    t.integer  "role_id",                 null: false
    t.integer  "response_skill_check_id"
    t.integer  "encounter_id",            null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roll_effect_pairs", force: :cascade do |t|
    t.numrange "roll_range"
    t.integer  "roll"
    t.string   "upgrades",                      array: true
    t.integer  "credits"
    t.integer  "ellerium"
    t.integer  "wilkinide"
    t.integer  "galacite"
    t.integer  "plasma_cells"
    t.integer  "scrap_metal"
    t.integer  "medical_supplies"
    t.boolean  "refugees"
    t.integer  "effect_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "roll_effect_pairs", ["effect_id"], name: "index_roll_effect_pairs_on_effect_id", using: :btree
  add_index "roll_effect_pairs", ["upgrades"], name: "index_roll_effect_pairs_on_upgrades", using: :gin

  create_table "skill_check_obstacles", force: :cascade do |t|
    t.integer  "order",       null: false
    t.text     "description", null: false
    t.integer  "mission_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "skill_check_obstacles", ["mission_id"], name: "index_skill_check_obstacles_on_mission_id", using: :btree

  create_table "skill_checks", force: :cascade do |t|
    t.integer  "role_id",                 null: false
    t.integer  "skill_check_obstacle_id", null: false
    t.text     "description",             null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "skill_checks", ["role_id"], name: "index_skill_checks_on_role_id", using: :btree
  add_index "skill_checks", ["skill_check_obstacle_id"], name: "index_skill_checks_on_skill_check_obstacle_id", using: :btree

  add_foreign_key "effects", "outcomes"
  add_foreign_key "missions", "outcomes"
  add_foreign_key "requirements", "options"
  add_foreign_key "response_skill_checks", "options"
  add_foreign_key "roll_effect_pairs", "effects"
  add_foreign_key "skill_check_obstacles", "missions"
  add_foreign_key "skill_checks", "roles"
  add_foreign_key "skill_checks", "skill_check_obstacles"
end
