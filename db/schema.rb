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

ActiveRecord::Schema.define(version: 20161228141510) do

  create_table "child_fatalities", force: :cascade do |t|
    t.date     "dod"
    t.string   "gender"
    t.integer  "age"
    t.string   "county"
    t.boolean  "priorChild"
    t.boolean  "priorVerChild"
    t.boolean  "priorTwelve"
    t.boolean  "priorFive"
    t.boolean  "priorFiveServices"
    t.string   "causal"
    t.text     "narrative"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
