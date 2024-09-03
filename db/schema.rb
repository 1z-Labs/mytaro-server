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

ActiveRecord::Schema[7.0].define(version: 2024_09_03_081304) do
  create_table "categories", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "icon"
  end

  create_table "contents", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.string "description"
    t.string "imagePath", null: false
    t.string "content", null: false
    t.integer "clover", null: false
  end

  create_table "my_infos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "gender"
    t.date "birthday"
    t.time "birthClock"
    t.string "pName"
    t.integer "pGender"
    t.date "pBirthday"
    t.time "pBirthClock"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "review"
    t.string "author"
    t.string "contentId"
    t.string "authorId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authorId"], name: "fk_rails_eee972c45c"
    t.index ["contentId"], name: "fk_rails_908da70a07"
  end

  create_table "users", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nickname"
    t.string "phone"
    t.boolean "isBeforePurchased", default: false
  end

  add_foreign_key "reviews", "contents", column: "contentId"
  add_foreign_key "reviews", "users", column: "authorId"
end
