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

ActiveRecord::Schema.define(version: 2020_09_20_082203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "editable_fields", force: :cascade do |t|
    t.string "label"
    t.string "kind"
    t.text "value"
    t.bigint "editable_page_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["editable_page_id"], name: "index_editable_fields_on_editable_page_id"
  end

  create_table "editable_pages", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "editable_fields", "editable_pages"
end
