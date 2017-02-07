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

ActiveRecord::Schema.define(version: 20170207201440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.integer  "pilot_id"
    t.integer  "upgrade_id"
    t.string   "image_path"
    t.string   "xws"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pilot_id"], name: "index_conditions_on_pilot_id", using: :btree
    t.index ["upgrade_id"], name: "index_conditions_on_upgrade_id", using: :btree
  end

  create_table "factions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pilots", force: :cascade do |t|
    t.integer  "ship_id"
    t.integer  "faction_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "xws"
    t.string   "image_path"
    t.index ["faction_id"], name: "index_pilots_on_faction_id", using: :btree
    t.index ["ship_id"], name: "index_pilots_on_ship_id", using: :btree
  end

  create_table "ship_combos", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "archetype_name"
  end

  create_table "ship_combos_ships", id: false, force: :cascade do |t|
    t.integer "ship_id"
    t.integer "ship_combo_id"
    t.index ["ship_combo_id"], name: "index_ship_combos_ships_on_ship_combo_id", using: :btree
    t.index ["ship_id"], name: "index_ship_combos_ships_on_ship_id", using: :btree
  end

  create_table "ship_configurations", force: :cascade do |t|
    t.integer  "squadron_id"
    t.integer  "pilot_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["pilot_id"], name: "index_ship_configurations_on_pilot_id", using: :btree
    t.index ["squadron_id"], name: "index_ship_configurations_on_squadron_id", using: :btree
  end

  create_table "ship_configurations_upgrades", id: false, force: :cascade do |t|
    t.integer "ship_configuration_id"
    t.integer "upgrade_id"
    t.index ["ship_configuration_id"], name: "index_ship_configurations_upgrades_on_ship_configuration_id", using: :btree
    t.index ["upgrade_id"], name: "index_ship_configurations_upgrades_on_upgrade_id", using: :btree
  end

  create_table "ships", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "font_icon_class"
    t.string   "xws"
  end

  create_table "squadrons", force: :cascade do |t|
    t.integer  "faction_id"
    t.integer  "tournament_id"
    t.integer  "lists_juggler_id"
    t.integer  "points"
    t.integer  "swiss_standing"
    t.integer  "elimination_standing"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "swiss_percentile"
    t.float    "elimination_percentile"
    t.integer  "ship_combo_id"
    t.string   "player_name"
    t.index ["faction_id"], name: "index_squadrons_on_faction_id", using: :btree
    t.index ["ship_combo_id"], name: "index_squadrons_on_ship_combo_id", using: :btree
    t.index ["tournament_id"], name: "index_squadrons_on_tournament_id", using: :btree
  end

  create_table "tournament_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.date     "date"
    t.string   "name"
    t.integer  "tournament_type_id"
    t.integer  "lists_juggler_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "lists_juggler_venue_id"
    t.string   "venue"
    t.integer  "num_players"
    t.integer  "round_length"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.index ["tournament_type_id"], name: "index_tournaments_on_tournament_type_id", using: :btree
  end

  create_table "upgrade_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "font_icon_class"
  end

  create_table "upgrades", force: :cascade do |t|
    t.string   "name"
    t.integer  "upgrade_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "xws"
    t.string   "image_path"
    t.index ["upgrade_type_id"], name: "index_upgrades_on_upgrade_type_id", using: :btree
  end

  add_foreign_key "conditions", "pilots"
  add_foreign_key "conditions", "upgrades"
  add_foreign_key "pilots", "factions"
  add_foreign_key "pilots", "ships"
  add_foreign_key "ship_combos_ships", "ship_combos"
  add_foreign_key "ship_combos_ships", "ships"
  add_foreign_key "ship_configurations", "pilots"
  add_foreign_key "ship_configurations", "squadrons"
  add_foreign_key "ship_configurations_upgrades", "ship_configurations"
  add_foreign_key "ship_configurations_upgrades", "upgrades"
  add_foreign_key "squadrons", "factions"
  add_foreign_key "squadrons", "ship_combos"
  add_foreign_key "squadrons", "tournaments"
  add_foreign_key "tournaments", "tournament_types"
  add_foreign_key "upgrades", "upgrade_types"
end
