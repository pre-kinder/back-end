ActiveRecord::Schema.define(version: 2021_11_05_211819) do

  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.integer "attendance_status"
    t.bigint "parent_id"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_children_on_classroom_id"
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "classroom_id"
    t.string "title"
    t.text "description"
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_events_on_classroom_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.string "phone_number"
    t.string "google_image_url"
    t.string "google_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.bigint "classroom_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.string "phone_number"
    t.string "google_image_url"
    t.string "google_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_teachers_on_classroom_id"
  end

  add_foreign_key "children", "classrooms"
  add_foreign_key "children", "parents"
  add_foreign_key "events", "classrooms"
  add_foreign_key "teachers", "classrooms"
end
