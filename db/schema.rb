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

ActiveRecord::Schema[7.0].define(version: 2024_09_03_070409) do
  create_table "ContentCategory", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "contentId"
    t.string "categoryId"
  end

  create_table "InputInfo", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.column "gender", "enum('male','female')", null: false
    t.string "birthday", null: false
    t.string "birthClock"
    t.string "pName", null: false
    t.column "pGender", "enum('male','female')", null: false
    t.string "pBirthday", null: false
    t.string "pBirthClock"
    t.string "userId"
    t.index ["userId"], name: "userId"
  end

  create_table "Preview", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "imagePath", null: false
    t.string "contentId"
  end

  create_table "Review", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "review", null: false
    t.string "author", null: false
    t.timestamp "created_at"
    t.string "contentId"
    t.string "authorId"
  end

  create_table "User", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "phone", null: false
    t.boolean "isBeforePurchased", default: false, null: false
  end

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
    t.integer "gender"
    t.date "birthday"
    t.time "birthClock"
    t.string "pName"
    t.integer "pGender"
    t.date "pBirthday"
    t.time "pBirthClock"
    t.string "userId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "gender"
    t.date "birthday"
    t.time "birthtime"
    t.string "pname"
    t.integer "pgender"
    t.date "pbirthday"
    t.time "pbirthtime"
    t.integer "userId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "InputInfo", "User", column: "userId", name: "InputInfo_ibfk_1"
end
