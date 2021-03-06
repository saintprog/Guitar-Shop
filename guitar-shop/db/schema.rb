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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140115112603) do

  create_table "cart_guitars", :force => true do |t|
    t.integer  "guitar_id"
    t.integer  "cart_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cart_guitars", ["cart_id"], :name => "index_cart_guitars_on_cart_id"
  add_index "cart_guitars", ["guitar_id"], :name => "index_cart_guitars_on_guitar_id"

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "guitar_ids"
  end

  add_index "carts", ["user_id"], :name => "index_carts_on_user_id"

  create_table "carts_guitars", :force => true do |t|
    t.integer "guitar_id"
    t.integer "cart_id"
  end

  create_table "guitars", :force => true do |t|
    t.string   "brand"
    t.string   "model"
    t.integer  "cost"
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

# Could not dump table "orders" because of following StandardError
#   Unknown type 'belongs_to' for column 'cart_id'

  create_table "payments", :force => true do |t|
    t.integer  "order_id"
    t.integer  "summ"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "payments", ["order_id"], :name => "index_payments_on_order_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name"
    t.string   "surname"
    t.date     "birthday"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
