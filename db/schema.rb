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

ActiveRecord::Schema.define(version: 2018_08_30_212104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "activity_type_id"
    t.bigint "taxation_form_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_form_id"
    t.index ["activity_type_id"], name: "index_activities_on_activity_type_id"
    t.index ["organization_form_id"], name: "index_activities_on_organization_form_id"
    t.index ["organization_id"], name: "index_activities_on_organization_id"
    t.index ["taxation_form_id"], name: "index_activities_on_taxation_form_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "activity_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_types_organization_forms", id: false, force: :cascade do |t|
    t.bigint "activity_type_id", null: false
    t.bigint "organization_form_id", null: false
  end

  create_table "activity_types_taxation_forms", id: false, force: :cascade do |t|
    t.bigint "activity_type_id", null: false
    t.bigint "taxation_form_id", null: false
  end

  create_table "calculation_forms", force: :cascade do |t|
    t.string "type", null: false
    t.float "rate"
    t.bigint "taxation_form_id"
    t.bigint "activity_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_type_id"], name: "index_calculation_forms_on_activity_type_id"
    t.index ["taxation_form_id"], name: "index_calculation_forms_on_taxation_form_id"
  end

  create_table "constraints", force: :cascade do |t|
    t.bigint "taxation_form_id"
    t.bigint "organization_form_id"
    t.string "value"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_form_id"], name: "index_constraints_on_organization_form_id"
    t.index ["taxation_form_id"], name: "index_constraints_on_taxation_form_id"
  end

  create_table "hints", force: :cascade do |t|
    t.string "hint_owner_type"
    t.bigint "hint_owner_id"
    t.index ["hint_owner_type", "hint_owner_id"], name: "index_hints_on_hint_owner_type_and_hint_owner_id"
  end

  create_table "organization_forms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_form_id"
    t.index ["organization_form_id"], name: "index_organizations_on_organization_form_id"
  end

  create_table "recurrence_periods", force: :cascade do |t|
    t.string "type"
    t.integer "day_start"
    t.integer "day_end"
    t.integer "month_start"
    t.integer "month_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string "description"
    t.bigint "organization_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_form_id"], name: "index_steps_on_organization_form_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "type"
    t.daterange "period"
    t.date "date"
    t.string "description"
    t.string "status"
    t.bigint "activity_id"
    t.bigint "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "step_id"
    t.index ["activity_id"], name: "index_tasks_on_activity_id"
    t.index ["step_id"], name: "index_tasks_on_step_id"
    t.index ["tax_id"], name: "index_tasks_on_tax_id"
  end

  create_table "taxation_forms", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.bigint "organization_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "declaration_period_id"
    t.bigint "payment_period_id"
    t.index ["declaration_period_id"], name: "index_taxation_forms_on_declaration_period_id"
    t.index ["organization_form_id"], name: "index_taxation_forms_on_organization_form_id"
    t.index ["payment_period_id"], name: "index_taxation_forms_on_payment_period_id"
  end

  create_table "taxes", force: :cascade do |t|
    t.string "name"
    t.bigint "activity_id"
    t.float "receipts"
    t.float "exchange_difference"
    t.float "gross_revenue"
    t.float "sum_tax"
    t.daterange "payment_period"
    t.daterange "declaration_period"
    t.index ["activity_id"], name: "index_taxes_on_activity_id"
  end

  create_table "translates", force: :cascade do |t|
    t.text "text"
    t.string "locale"
    t.integer "hint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "activity_types"
  add_foreign_key "activities", "organization_forms"
  add_foreign_key "activities", "organizations"
  add_foreign_key "activities", "taxation_forms"
  add_foreign_key "activities", "users"
  add_foreign_key "calculation_forms", "activity_types"
  add_foreign_key "calculation_forms", "taxation_forms"
  add_foreign_key "constraints", "organization_forms"
  add_foreign_key "constraints", "taxation_forms"
  add_foreign_key "organizations", "organization_forms"
  add_foreign_key "steps", "organization_forms"
  add_foreign_key "tasks", "activities"
  add_foreign_key "tasks", "steps"
  add_foreign_key "tasks", "taxes"
  add_foreign_key "taxation_forms", "organization_forms"
  add_foreign_key "taxation_forms", "recurrence_periods", column: "declaration_period_id"
  add_foreign_key "taxation_forms", "recurrence_periods", column: "payment_period_id"
  add_foreign_key "taxes", "activities"
end
