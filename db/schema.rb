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

ActiveRecord::Schema.define(version: 20130906144756) do

  create_table "achievements", force: true do |t|
    t.string   "name"
    t.integer  "points"
    t.boolean  "repeatable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "achiever_id"
  end

  add_index "achievements", ["achiever_id"], name: "index_achievements_on_achiever_id"

  create_table "achievers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "punishers", force: true do |t|
    t.string   "name"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "achiever_id"
  end

  add_index "punishers", ["achiever_id"], name: "index_punishers_on_achiever_id"

  create_table "rewards", force: true do |t|
    t.string   "name"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "achiever_id"
  end

  add_index "rewards", ["achiever_id"], name: "index_rewards_on_achiever_id"

  create_table "status_changes", force: true do |t|
    t.string   "source"
    t.text     "comment"
    t.integer  "point_change"
    t.datetime "ts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "achiever_id"
    t.integer  "points_after"
  end

  add_index "status_changes", ["achiever_id"], name: "index_status_changes_on_achiever_id"

end
