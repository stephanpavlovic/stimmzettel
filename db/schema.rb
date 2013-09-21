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

ActiveRecord::Schema.define(version: 20130921132634) do

  create_table "bundestag_election_party_votes", force: true do |t|
    t.integer  "bundestag_election_id"
    t.integer  "party_id"
    t.integer  "vote_count"
    t.float    "vote_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bundestag_elections", force: true do |t|
    t.date     "elective_date"
    t.integer  "elective_count"
    t.float    "elective_percent"
    t.integer  "had_choosen_count"
    t.float    "had_choosen_percent"
    t.integer  "valid_votes_count"
    t.float    "valid_votes_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "electoral_districts", force: true do |t|
    t.string   "official_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", force: true do |t|
    t.string   "slug"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
  end

  create_table "politicans", force: true do |t|
    t.string   "name"
    t.integer  "party_id"
    t.integer  "electoral_district_id"
    t.string   "job"
    t.string   "city"
    t.string   "year_of_birth"
    t.string   "parlament_watch_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
