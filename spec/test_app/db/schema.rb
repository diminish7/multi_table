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

ActiveRecord::Schema.define(version: 2018_08_24_125402) do

  create_table "dogs", force: :cascade do |t|
    t.string "breed"
    t.boolean "mix", default: true, null: false
  end

  create_table "fish", force: :cascade do |t|
    t.boolean "freshwater"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "multi_table_type"
    t.integer "multi_table_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multi_table_type", "multi_table_id"], name: "index_pets_on_multi_table_type_and_multi_table_id"
  end

end
