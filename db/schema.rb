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

ActiveRecord::Schema.define(version: 20181109080052) do

  create_table "farms", force: :cascade do |t|
    t.string   "name"
    t.string   "farm_type"
    t.string   "admin"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_farms_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "complete"
    t.integer  "person"
    t.string   "location"
    t.string   "welfare"
    t.date     "start_date"
    t.date     "end_data"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "serves", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "person"
    t.date     "start_date"
    t.date     "end_data"
    t.string   "location"
    t.integer  "user_id"
    t.integer  "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_serves_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "phone",                  default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
