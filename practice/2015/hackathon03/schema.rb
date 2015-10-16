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

ActiveRecord::Schema.define(version: 20150224001338) do
  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password"
    t.string   "twitter_token"
    t.string   "facebook"
    t.boolean  "paid_flg",       default: false
    t.string   "remember_token"
    t.boolean  "deleted",        default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "twitter_name"
    t.integer  "power",          default: 5
    t.integer  "job_id",         default: -1
  end
  
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
end
