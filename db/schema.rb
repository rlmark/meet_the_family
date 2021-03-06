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

ActiveRecord::Schema.define(version: 20150106045529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "decks", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relations", force: true do |t|
    t.integer  "relative_id"
    t.integer  "familymember_id"
    t.boolean  "divorced"
    t.boolean  "step"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relatives", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "pronouns"
    t.text     "notes"
    t.text     "likes"
    t.text     "dislikes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deck_id"
    t.string   "avatar"
  end

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "password_digest"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "relative_id"
  end

end
