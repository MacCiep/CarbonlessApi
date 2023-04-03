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

ActiveRecord::Schema.define(version: 2023_03_31_113656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "title", null: false
    t.integer "scope_of_days"
    t.integer "points"
    t.integer "type"
    t.string "script", null: false
  end

  create_table "history_points", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "points", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "start_station"
    t.integer "end_station"
    t.integer "category"
    t.datetime "start_datetime"
    t.integer "history_type"
    t.integer "purchase_price"
    t.index ["user_id"], name: "index_history_points_on_user_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "prizes", force: :cascade do |t|
    t.string "title", null: false
    t.integer "price", null: false
    t.integer "duration", null: false
  end

  create_table "travel_sessions", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "start_station", null: false
    t.integer "end_station"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "travel_tool"
    t.index ["user_id"], name: "index_travel_sessions_on_user_id"
  end

  create_table "user_achievements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "achievement_id", null: false
    t.integer "counter", default: 0, null: false
    t.index ["achievement_id"], name: "index_user_achievements_on_achievement_id"
    t.index ["user_id"], name: "index_user_achievements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "lastname", null: false
    t.bigint "points", default: 0, null: false
    t.decimal "total_carbon_saved", default: "0.0"
    t.boolean "tgtg_active", default: false, null: false
    t.integer "tgtg_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_prizes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "prize_id"
    t.integer "duration_left", null: false
    t.index ["prize_id"], name: "index_users_prizes_on_prize_id"
    t.index ["user_id"], name: "index_users_prizes_on_user_id"
  end

end
