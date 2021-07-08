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

ActiveRecord::Schema.define(version: 2021_07_08_220330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_histories", force: :cascade do |t|
    t.string "start_date"
    t.string "end_date"
    t.string "title"
    t.bigint "company_id", null: false
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "talent_id", null: false
    t.index ["company_id"], name: "index_job_histories_on_company_id"
    t.index ["talent_id"], name: "index_job_histories_on_talent_id"
  end

  create_table "talents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.string "team"
    t.string "sub_team"
    t.string "title"
    t.string "contact"
    t.text "notes"
    t.string "email"
    t.boolean "intern"
    t.string "grad_year"
    t.string "institution"
    t.string "level"
    t.string "course"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "business_unit"
    t.string "entry_year"
    t.string "entity"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "job_histories", "companies"
  add_foreign_key "job_histories", "talents"
end
