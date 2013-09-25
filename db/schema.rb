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

ActiveRecord::Schema.define(version: 20130925185148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.integer  "team_id"
    t.integer  "creator_id"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "vs_team_id"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "sports", force: true do |t|
    t.string   "name"
    t.string   "positions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_sports", force: true do |t|
    t.integer  "team_id"
    t.integer  "sport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "captain_id"
    t.integer  "league_id"
    t.boolean  "external_league"
    t.string   "league_name"
    t.string   "league_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "experience_level"
    t.boolean  "looking_free_agents"
    t.boolean  "privacy_toggle"
    t.string   "team_type"
    t.string   "year_founded"
    t.text     "bio"
    t.text     "achievements"
    t.string   "availability"
    t.string   "photo"
  end

  add_index "teams", ["captain_id"], name: "index_teams_on_captain_id", using: :btree

  create_table "user_games", force: true do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "user_sports", force: true do |t|
    t.integer "user_id"
    t.string  "position"
    t.integer "sport_id"
  end

  create_table "user_teams", force: true do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.boolean "membership"
  end

  add_index "user_teams", ["team_id"], name: "index_user_teams_on_team_id", using: :btree
  add_index "user_teams", ["user_id"], name: "index_user_teams_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "gender"
    t.boolean  "privacy_toggle"
    t.string   "photo"
    t.text     "bio"
    t.string   "phone"
    t.string   "city"
    t.string   "achievements"
    t.string   "experience_level"
    t.boolean  "desire_to_join"
    t.string   "distance_to_travel"
    t.string   "availability"
    t.string   "invitation_token",       limit: 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invited_to_id"
    t.string   "state"
    t.boolean  "is_admin",                          default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
