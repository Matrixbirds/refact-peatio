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

ActiveRecord::Schema.define(version: 20180313125532) do

  create_table "coins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "balance", precision: 32, scale: 16
    t.bigint "coin_id"
    t.decimal "price", precision: 32, scale: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["balance"], name: "index_currencies_on_balance"
    t.index ["coin_id"], name: "index_currencies_on_coin_id"
    t.index ["price"], name: "index_currencies_on_price"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "state"
    t.integer "is_locked"
    t.bigint "creator_id"
    t.decimal "price", precision: 32, scale: 16
    t.integer "currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_orders_on_creator_id"
    t.index ["currency_id"], name: "index_orders_on_currency_id"
    t.index ["price"], name: "index_orders_on_price"
    t.index ["state"], name: "index_orders_on_state"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["phone"], name: "index_users_on_phone"
  end

end
