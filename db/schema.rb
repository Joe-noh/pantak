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

ActiveRecord::Schema.define(version: 20150626025921) do

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "nick_name"
    t.integer  "job_type"
    t.integer  "emp_number"
    t.text     "self_introduction"
    t.string   "icon"
    t.boolean  "admin",             default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "users", ["full_name", "nick_name"], name: "index_users_on_full_name_and_nick_name", unique: true
  add_index "users", ["nick_name"], name: "index_users_on_nick_name", unique: true

end