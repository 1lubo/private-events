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

ActiveRecord::Schema[7.0].define(version: 2022_06_22_132021) do
  create_table "event_attendings", force: :cascade do |t|
    t.integer "event_attendee_id"
    t.integer "attended_event_id"
    t.index ["attended_event_id"], name: "index_event_attendings_on_attended_event_id"
    t.index ["event_attendee_id"], name: "index_event_attendings_on_event_attendee_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "location"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_attendings", "events", column: "attended_event_id"
  add_foreign_key "event_attendings", "users", column: "event_attendee_id"
  add_foreign_key "events", "users", column: "creator_id"
end
