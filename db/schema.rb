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

ActiveRecord::Schema.define(version: 20151012120905) do

  create_table "compounds", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "molecular_formula", limit: 255
    t.float    "molar_mass",        limit: 24
    t.string   "cas",               limit: 255
    t.text     "structure",         limit: 65535
    t.string   "amount",            limit: 255
    t.string   "shelf",             limit: 255
    t.string   "room_number",       limit: 255
    t.string   "smiles",            limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "created_by",        limit: 4
    t.integer  "edited_by",         limit: 4
    t.string   "additional_info",   limit: 255
  end

  create_table "searches", force: :cascade do |t|
    t.string   "keywords",   limit: 255
    t.string   "formula",    limit: 255
    t.float    "min_mass",   limit: 24
    t.float    "max_mass",   limit: 24
    t.text     "molecule",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "cas_number", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false
    t.string   "username",               limit: 255
    t.boolean  "editor",                             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
