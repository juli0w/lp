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

ActiveRecord::Schema.define(:version => 20150831161945) do

  create_table "cache_products", :force => true do |t|
    t.integer  "cache_type"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "active",         :default => true
    t.integer  "alternative_id"
    t.integer  "level"
    t.string   "slug"
  end

  create_table "coupons", :force => true do |t|
    t.string   "name"
    t.decimal  "value",         :precision => 8, :scale => 2
    t.integer  "discount_type"
    t.datetime "expire_at"
    t.integer  "owner_id"
    t.boolean  "active",                                      :default => true
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  create_table "failures", :force => true do |t|
    t.string   "name"
    t.text     "message"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "state",      :default => false
    t.text     "backtrace"
    t.text     "details"
    t.text     "request"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "external_id"
    t.string   "um"
    t.decimal  "price",       :precision => 10, :scale => 2
    t.boolean  "active"
    t.string   "image"
    t.integer  "category_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "slug"
  end

  add_index "items", ["slug"], :name => "index_items_on_slug"

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.string   "subject"
    t.boolean  "read",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "name"
    t.string   "email"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "page_type",  :default => 0
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "cep"
    t.string   "address"
    t.string   "number"
    t.string   "city"
    t.string   "uf"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "phone"
    t.string   "cellphone"
    t.string   "district"
    t.string   "complement"
  end

  create_table "purchase_items", :force => true do |t|
    t.integer  "purchase_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "options"
    t.decimal  "price",       :precision => 10, :scale => 2
  end

  create_table "purchases", :force => true do |t|
    t.string   "phone"
    t.string   "cellphone"
    t.string   "complement"
    t.string   "cep"
    t.string   "address"
    t.string   "district"
    t.string   "number"
    t.string   "city"
    t.string   "uf"
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "state",      :default => 0
    t.string   "name"
    t.integer  "coupon_id"
  end

  create_table "redactor_assets", :force => true do |t|
    t.integer  "user_id"
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], :name => "idx_redactor_assetable"
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_redactor_assetable_type"

  create_table "setups", :force => true do |t|
    t.string   "emails"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "categories"
  end

  create_table "ticket_repplies", :force => true do |t|
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "state"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "state"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
