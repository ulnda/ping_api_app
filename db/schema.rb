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

ActiveRecord::Schema.define(version: 20141015170803) do

  create_table "messages", force: true do |t|
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.string   "text",        null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id"
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id"

  create_table "users", force: true do |t|
    t.string   "phone",                         null: false
    t.integer  "pin",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "authenticated", default: false, null: false
  end

  add_index "users", ["authenticated"], name: "index_users_on_authenticated"
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true

end
