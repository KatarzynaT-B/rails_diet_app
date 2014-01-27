# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140126121659) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "source"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dishes", force: true do |t|
    t.string   "dish_name"
    t.text     "steps"
    t.float    "dish_protein"
    t.float    "dish_fat"
    t.float    "dish_carbs"
    t.float    "dish_calories"
    t.integer  "ingredient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.integer  "product_id"
    t.integer  "dish_id"
    t.float    "quantity_per_dish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "calories"
    t.float    "protein"
    t.float    "fat"
    t.float    "carbs"
    t.integer  "ingredient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.integer  "sex"
    t.integer  "age"
    t.integer  "weight"
    t.integer  "height"
    t.integer  "activity_level"
    t.float    "calories_need"
    t.float    "protein_need"
    t.float    "fat_need"
    t.float    "carbs_need"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end