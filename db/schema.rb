# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_27_020130) do

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "subject", default: 0, null: false
    t.text "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "sauna_name"
    t.string "temperature"
    t.string "water"
    t.string "prefecture"
    t.string "postal_code"
    t.string "address"
    t.string "image_id"
    t.string "working_hours"
    t.string "phone_number"
    t.text "price_description"
    t.string "hp"
    t.boolean "parking"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "facility_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id"], name: "index_favorites_on_facility_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "forums", force: :cascade do |t|
    t.text "message"
    t.integer "topic_id"
    t.integer "user_id"
    t.string "forum_image_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "sauna_name"
    t.string "temperature"
    t.string "water"
    t.string "prefecture"
    t.string "postal_code"
    t.string "address"
    t.string "image_id"
    t.string "working_hours"
    t.string "phone_number"
    t.text "price_description"
    t.string "hp"
    t.boolean "parking"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.float "rate", null: false
    t.text "comment"
    t.integer "user_id"
    t.integer "facility_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id"], name: "index_reviews_on_facility_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "forum_id"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_deleted", default: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
