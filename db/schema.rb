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

ActiveRecord::Schema[8.0].define(version: 2024_07_19_152608) do
  create_table "email_addresses", force: :cascade do |t|
    t.string "address", null: false
    t.string "emailable_type", null: false
    t.integer "emailable_id", null: false
    t.integer "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emailable_type", "emailable_id"], name: "index_email_addresses_on_emailable"
    t.index ["school_id"], name: "index_email_addresses_on_school_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "school_id", null: false
    t.string "first_name", null: false
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sex"
    t.string "pin", null: false
    t.date "birthday"
    t.string "status", default: "active"
    t.index ["school_id"], name: "index_members_on_school_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "number", null: false
    t.boolean "sms", default: false, null: false
    t.string "callable_type", null: false
    t.integer "callable_id", null: false
    t.integer "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["callable_type", "callable_id"], name: "index_phone_numbers_on_callable"
    t.index ["school_id"], name: "index_phone_numbers_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.string "subdomain", null: false
    t.string "timezone", null: false
    t.string "status", default: "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "members", "schools"
end
