# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100901225127) do

  create_table "assignments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brides", :force => true do |t|
    t.string   "name"
    t.date     "wedding_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donation_transactions", :force => true do |t|
    t.integer  "donation_id"
    t.string   "action"
    t.float    "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", :force => true do |t|
    t.integer  "gift_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expiration"
    t.float    "amount"
    t.string   "express_token"
    t.string   "express_payer_id"
    t.boolean  "paypal_donation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gifts", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.float    "total_donations"
    t.integer  "bride_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hellos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moves", :force => true do |t|
    t.string   "name"
    t.string   "image_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_mailers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "facebook_id", :null => false
    t.string   "session_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
