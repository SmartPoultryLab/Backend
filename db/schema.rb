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

ActiveRecord::Schema.define(version: 2021_05_25_010731) do

  create_table "birds", charset: "utf8mb4", force: :cascade do |t|
    t.string "bird_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "breeds", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "bird_id", null: false
    t.string "breed_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bird_id"], name: "index_breeds_on_bird_id"
  end

  create_table "drugfamilies", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "drugs", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "drugfamily_id", null: false
    t.string "drug_name"
    t.decimal "unit_factor", precision: 10
    t.decimal "unit_price", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drugfamily_id"], name: "index_drugs_on_drugfamily_id"
  end

  create_table "farm_treatments", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "inspection_id", null: false
    t.bigint "drug_id", null: false
    t.decimal "quantity", precision: 10
    t.decimal "total_price", precision: 10
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drug_id"], name: "index_farm_treatments_on_drug_id"
    t.index ["inspection_id"], name: "index_farm_treatments_on_inspection_id"
  end

  create_table "farm_vaccinations", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "inspection_id", null: false
    t.bigint "vaccine_id", null: false
    t.decimal "quantity", precision: 10
    t.decimal "total_price", precision: 10
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inspection_id"], name: "index_farm_vaccinations_on_inspection_id"
    t.index ["vaccine_id"], name: "index_farm_vaccinations_on_vaccine_id"
  end

  create_table "farms", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.bigint "user_id", null: false
    t.bigint "bird_id", null: false
    t.bigint "breed_id", null: false
    t.bigint "housing_id", null: false
    t.bigint "food_id", null: false
    t.string "farm_name"
    t.decimal "num_of_breeds", precision: 10
    t.datetime "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bird_id"], name: "index_farms_on_bird_id"
    t.index ["breed_id"], name: "index_farms_on_breed_id"
    t.index ["food_id"], name: "index_farms_on_food_id"
    t.index ["housing_id"], name: "index_farms_on_housing_id"
    t.index ["owner_id"], name: "index_farms_on_owner_id"
    t.index ["user_id"], name: "index_farms_on_user_id"
  end

  create_table "foods", charset: "utf8mb4", force: :cascade do |t|
    t.string "food_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "housings", charset: "utf8mb4", force: :cascade do |t|
    t.string "housingName", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inspections", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "farm_id", null: false
    t.datetime "inspection_date"
    t.decimal "current_age", precision: 10
    t.decimal "dead_last_3_days", precision: 10
    t.decimal "feed_consumption", precision: 10
    t.decimal "water_consumption", precision: 10
    t.decimal "average_weight", precision: 10
    t.text "other_notes"
    t.text "clinical_signs"
    t.text "pm_lesions"
    t.text "diagnoses"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_inspections_on_farm_id"
    t.index ["user_id"], name: "index_inspections_on_user_id"
  end

  create_table "owners", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "number"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "fullName"
    t.string "email"
    t.string "password_digest"
    t.string "avatarUrl"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vaccine_families", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vaccines", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vaccine_family_id", null: false
    t.string "name"
    t.decimal "unit_factor", precision: 10
    t.decimal "unit_price", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vaccine_family_id"], name: "index_vaccines_on_vaccine_family_id"
  end

  add_foreign_key "breeds", "birds", on_delete: :cascade
  add_foreign_key "farm_treatments", "drugs", on_delete: :cascade
  add_foreign_key "farm_treatments", "inspections", on_delete: :cascade
  add_foreign_key "farm_vaccinations", "inspections", on_delete: :cascade
  add_foreign_key "farm_vaccinations", "vaccines", on_delete: :cascade
  add_foreign_key "farms", "birds", on_delete: :cascade
  add_foreign_key "farms", "breeds", on_delete: :cascade
  add_foreign_key "farms", "foods", on_delete: :cascade
  add_foreign_key "farms", "housings", on_delete: :cascade
  add_foreign_key "farms", "owners", on_delete: :cascade
  add_foreign_key "farms", "users", on_delete: :cascade
  add_foreign_key "owners", "users", on_delete: :cascade
end
