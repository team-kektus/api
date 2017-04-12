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

ActiveRecord::Schema.define(version: 20170412082748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grading_aspects", force: :cascade do |t|
    t.string  "number",                      null: false
    t.string  "name",                        null: false
    t.integer "deadline"
    t.integer "max_points",  default: 0,     null: false
    t.string  "url",         default: ""
    t.boolean "is_multiple", default: false, null: false
    t.index ["number"], name: "index_grading_aspects_on_number", unique: true, using: :btree
  end

  create_table "points", force: :cascade do |t|
    t.integer  "presentation_date",               null: false
    t.float    "points",            default: 0.0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "team_id",                         null: false
    t.integer  "grading_aspect_id",               null: false
    t.index ["grading_aspect_id"], name: "index_points_on_grading_aspect_id", using: :btree
    t.index ["team_id"], name: "index_points_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string "name",                        null: false
    t.string "project_name",                null: false
    t.string "repository_url", default: ""
    t.string "staging_url",    default: ""
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",                           null: false
    t.string   "email",                               null: false
    t.string   "encrypted_password",                  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_admin",            default: false, null: false
    t.boolean  "is_professor",        default: false, null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "speciality",          default: ""
    t.string   "address",             default: ""
    t.string   "county",              default: ""
    t.integer  "team_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

  add_foreign_key "points", "grading_aspects"
  add_foreign_key "points", "teams"
  add_foreign_key "users", "teams"
end
