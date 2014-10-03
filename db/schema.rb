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

ActiveRecord::Schema.define(version: 20141003190340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "hash_tags",  default: [], array: true
  end

  create_table "slack_conversations", force: true do |t|
    t.boolean  "complete",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slack_responses", force: true do |t|
    t.string   "team_id"
    t.string   "team_domain"
    t.integer  "service_id",            limit: 8
    t.string   "channel_id"
    t.string   "channel_name"
    t.datetime "timestamp"
    t.string   "user_id"
    t.string   "user_name"
    t.text     "text"
    t.text     "hash_tags",                       default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "slack_conversation_id"
  end

  add_index "slack_responses", ["text"], name: "index_slack_responses_on_text", using: :btree

end
