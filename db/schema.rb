# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_23_201542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "shopping_items", force: :cascade do |t|
    t.bigint "shopping_cart_id", null: false
    t.bigint "wand_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shopping_cart_id"], name: "index_shopping_items_on_shopping_cart_id"
    t.index ["wand_id"], name: "index_shopping_items_on_wand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wands", force: :cascade do |t|
    t.string "name"
    t.string "manufacture"
    t.string "wood"
    t.string "core"
    t.string "previous_owners"
    t.bigint "user_id", null: false
    t.integer "quantity"
    t.float "price"
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wands_on_user_id"
  end

  add_foreign_key "shopping_carts", "users"
  add_foreign_key "shopping_items", "shopping_carts"
  add_foreign_key "shopping_items", "wands"
  add_foreign_key "wands", "users"
end
