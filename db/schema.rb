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

ActiveRecord::Schema.define(version: 2019_09_09_120549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "biographies", force: :cascade do |t|
    t.text "chapter"
    t.string "title"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_biographies_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "allies"
    t.string "enemies"
    t.string "description"
    t.bigint "user_id"
    t.bigint "race_id"
    t.bigint "gender_id"
    t.bigint "profession_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["gender_id"], name: "index_characters_on_gender_id"
    t.index ["profession_id"], name: "index_characters_on_profession_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "character_id"
    t.text "story"
    t.string "timeperiod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_histories_on_character_id"
  end

  create_table "professions", force: :cascade do |t|
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "race"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "picture"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "biographies", "characters"
  add_foreign_key "characters", "genders"
  add_foreign_key "characters", "professions"
  add_foreign_key "characters", "races"
  add_foreign_key "characters", "users"
  add_foreign_key "histories", "characters"
end
