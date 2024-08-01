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

ActiveRecord::Schema[8.0].define(version: 2024_07_31_014336) do
  create_table "email_addresses", force: :cascade do |t|
    t.string "address", null: false
    t.string "emailable_type", null: false
    t.integer "emailable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "network_id"
    t.index ["emailable_type", "emailable_id"], name: "index_email_addresses_on_emailable"
    t.index ["network_id"], name: "index_email_addresses_on_network_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sex"
    t.string "pin", null: false
    t.date "birthday"
    t.string "status", default: "active"
    t.integer "network_id"
    t.index ["network_id"], name: "index_members_on_network_id"
  end

  create_table "membership_templates", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "trial", default: false, null: false
    t.string "end_behavior", default: "cancel", null: false
    t.string "duration_type", default: "ongoing", null: false
    t.integer "term_length"
    t.string "term_interval"
    t.string "billing_type", default: "recurring", null: false
    t.decimal "price", precision: 21, scale: 3, default: "0.0", null: false
    t.decimal "late_fee", precision: 21, scale: 3, default: "0.0", null: false
    t.string "attendance_type", default: "unlimited", null: false
    t.integer "attendance_amount"
    t.string "attendance_interval"
    t.integer "network_id", null: false
    t.integer "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["network_id"], name: "index_membership_templates_on_network_id"
    t.index ["school_id"], name: "index_membership_templates_on_school_id"
  end

  create_table "networks", force: :cascade do |t|
    t.string "name", null: false
    t.string "status", default: "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "number", null: false
    t.boolean "sms", default: false, null: false
    t.string "callable_type", null: false
    t.integer "callable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "network_id"
    t.index ["callable_type", "callable_id"], name: "index_phone_numbers_on_callable"
    t.index ["network_id"], name: "index_phone_numbers_on_network_id"
  end

  create_table "school_affiliations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "school_id", null: false
    t.integer "network_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["network_id"], name: "index_school_affiliations_on_network_id"
    t.index ["school_id"], name: "index_school_affiliations_on_school_id"
    t.index ["user_id"], name: "index_school_affiliations_on_user_id"
  end

  create_table "school_registrations", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "school_id", null: false
    t.integer "network_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_school_registrations_on_member_id"
    t.index ["network_id"], name: "index_school_registrations_on_network_id"
    t.index ["school_id"], name: "index_school_registrations_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.string "subdomain", null: false
    t.string "timezone", null: false
    t.string "status", default: "active", null: false
    t.string "currency", limit: 3, default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "network_id"
    t.index ["network_id"], name: "index_schools_on_network_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "token"
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_sessions_on_token", unique: true
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.integer "network_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["network_id"], name: "index_users_on_network_id"
  end

  add_foreign_key "email_addresses", "networks"
  add_foreign_key "members", "networks"
  add_foreign_key "membership_templates", "networks"
  add_foreign_key "membership_templates", "schools"
  add_foreign_key "phone_numbers", "networks"
  add_foreign_key "school_affiliations", "networks"
  add_foreign_key "school_affiliations", "schools"
  add_foreign_key "school_affiliations", "users"
  add_foreign_key "school_registrations", "members"
  add_foreign_key "school_registrations", "networks"
  add_foreign_key "school_registrations", "schools"
  add_foreign_key "schools", "networks"
  add_foreign_key "sessions", "users"
  add_foreign_key "users", "networks"
end
