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

ActiveRecord::Schema.define(version: 2019_02_26_142603) do

  create_table "tweets", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "tweet_time", null: false
    t.text "tweet", null: false
    t.integer "favorite_count", default: 0, null: false
    t.integer "retweet_count", default: 0, null: false
    t.string "user_name", default: "", null: false
    t.text "tweet_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tweet_id", default: "", null: false
    t.integer "tweet_point", default: 0, null: false
    t.string "user_image", default: "", null: false
  end

end
