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

ActiveRecord::Schema.define(version: 20180212044640) do

  create_table "categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jokes", force: :cascade do |t|
    t.string "quote"
    t.string "question"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "source_id"
    t.index ["category_id"], name: "index_jokes_on_category_id"
    t.index ["source_id"], name: "index_jokes_on_source_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.decimal "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "joke_id"
    t.index ["joke_id"], name: "index_reviews_on_joke_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "source"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
