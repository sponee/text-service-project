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

ActiveRecord::Schema.define(version: 2019_10_25_210154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bad_phone_numbers", force: :cascade do |t|
    t.string "phone_number"
    t.index ["phone_number"], name: "index_bad_phone_numbers_on_phone_number"
  end

  create_table "text_messages", force: :cascade do |t|
    t.text "phone_number"
    t.text "message"
    t.text "message_id"
    t.text "status"
    t.index ["message"], name: "index_text_messages_on_message"
    t.index ["phone_number", "message"], name: "index_text_messages_on_phone_number_and_message"
    t.index ["phone_number"], name: "index_text_messages_on_phone_number"
    t.index ["status"], name: "index_text_messages_on_status"
  end

end
