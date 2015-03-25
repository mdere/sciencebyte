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

ActiveRecord::Schema.define(version: 20150323193550) do

  create_table "company_groups", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_registers", force: :cascade do |t|
    t.string   "business_name"
    t.integer  "address_number"
    t.string   "address_street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "contact_number"
    t.string   "account_handler_first"
    t.string   "account_handler_last"
    t.string   "password_hash"
    t.datetime "member_since"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "group_types", force: :cascade do |t|
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_type_id"
    t.integer  "total_users"
    t.integer  "total_companies"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "member_since"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "hashed_password"
    t.integer  "user_type_id"
    t.integer  "science_points"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
