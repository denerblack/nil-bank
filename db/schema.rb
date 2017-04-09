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

ActiveRecord::Schema.define(version: 20170409124711) do

  create_table "balances", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.float    "amount",         limit: 24, default: 0.0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.datetime "last_operation"
  end

  add_index "balances", ["user_id"], name: "index_balances_on_user_id", using: :btree

  create_table "investment_portfolios", force: :cascade do |t|
    t.string   "action",         limit: 255
    t.integer  "status",         limit: 4
    t.float    "purchase_price", limit: 24
    t.float    "sale_price",     limit: 24
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "quantity",       limit: 4
    t.integer  "sale_quantity",  limit: 4
  end

  add_index "investment_portfolios", ["user_id"], name: "index_investment_portfolios_on_user_id", using: :btree

  create_table "manager_visits", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "manager_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "amount",     limit: 24
  end

  add_index "manager_visits", ["user_id"], name: "index_manager_visits_on_user_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.string   "kind",           limit: 255
    t.float    "amount",         limit: 24,  default: 0.0
    t.integer  "balance_id",     limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "user_target_id", limit: 4
    t.integer  "user_source_id", limit: 4
  end

  add_index "transactions", ["balance_id"], name: "index_transactions_on_balance_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "account",                limit: 255
    t.string   "password",               limit: 255
    t.integer  "kind",                   limit: 4
    t.boolean  "manager",                            default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "balances", "users"
  add_foreign_key "investment_portfolios", "users"
  add_foreign_key "manager_visits", "users"
  add_foreign_key "transactions", "balances"
end
