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

ActiveRecord::Schema.define(version: 2018_10_04_011158) do

  create_table "accounts", force: :cascade do |t|
    t.string "type"
    t.date "doo"
    t.integer "account_no"
    t.float "balance"
    t.integer "customer_id"
    t.integer "bank_id"
    t.index ["bank_id"], name: "index_accounts_on_bank_id"
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
  end

  create_table "atms", force: :cascade do |t|
    t.string "location"
    t.string "managed_by"
    t.integer "bank_id"
    t.index ["bank_id"], name: "index_atms_on_bank_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.integer "code"
  end

  create_table "branches", force: :cascade do |t|
    t.string "address"
    t.integer "branch_code"
    t.integer "phone_no"
    t.integer "bank_id"
    t.index ["bank_id"], name: "index_branches_on_bank_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "marital_status"
    t.string "address"
    t.date "dob"
    t.integer "age"
    t.integer "contact_no"
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_customers_on_branch_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "designation"
    t.date "doj"
    t.integer "age"
    t.integer "contact_no"
    t.float "salary"
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_employees_on_branch_id"
  end

  create_table "loans", force: :cascade do |t|
    t.string "type"
    t.date "date"
    t.float "amount"
    t.float "rate"
    t.float "time_period"
    t.integer "customer_id"
    t.integer "bank_id"
    t.index ["bank_id"], name: "index_loans_on_bank_id"
    t.index ["customer_id"], name: "index_loans_on_customer_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "operation"
    t.date "date"
    t.integer "amount"
    t.integer "account_id"
    t.integer "atm_id"
    t.integer "branch_id"
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["atm_id"], name: "index_transactions_on_atm_id"
    t.index ["branch_id"], name: "index_transactions_on_branch_id"
  end

end
