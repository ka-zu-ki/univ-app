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

ActiveRecord::Schema.define(version: 2021_03_05_034325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lessons", force: :cascade do |t|
    t.string "name", null: false, comment: "講義名"
    t.string "professor", null: false, comment: "教授名"
    t.string "week", null: false, comment: "曜日"
    t.integer "time", null: false, comment: "時限"
    t.integer "room", null: false, comment: "教室番号"
    t.text "content", null: false, comment: "講義内容"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "myclasses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "lesson_id", null: false
    t.string "name", null: false, comment: "講義名"
    t.string "professor", null: false, comment: "教授名"
    t.string "week", null: false, comment: "曜日"
    t.integer "time", null: false, comment: "時限"
    t.integer "room", null: false, comment: "教室番号"
    t.text "content", null: false, comment: "講義内容"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_myclasses_on_lesson_id"
    t.index ["user_id"], name: "index_myclasses_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "myclass_id", null: false
    t.string "name", null: false
    t.boolean "is_completed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["myclass_id"], name: "index_todos_on_myclass_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "myclasses", "lessons"
  add_foreign_key "myclasses", "users"
  add_foreign_key "todos", "myclasses"
  add_foreign_key "todos", "users"
end
