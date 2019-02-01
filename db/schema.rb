# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_01_012205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beans", force: :cascade do |t|
    t.string "name", null: false
    t.string "location"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_beans_on_team_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "slack_id", null: false
    t.string "name", null: false
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_channels_on_team_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "weight", null: false
    t.integer "price_cents", null: false
    t.bigint "user_id"
    t.bigint "bean_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bean_id"], name: "index_purchases_on_bean_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "slack_id"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "slack_id", null: false
    t.string "name", null: false
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "beans", "teams"
  add_foreign_key "channels", "teams"
  add_foreign_key "purchases", "beans"
  add_foreign_key "purchases", "users"
  add_foreign_key "users", "teams"
end
