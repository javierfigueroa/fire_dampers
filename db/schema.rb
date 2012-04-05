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

ActiveRecord::Schema.define(:version => 20120403162149) do

  create_table "damper_statuses", :force => true do |t|
    t.string   "abbrev"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "damper_types", :force => true do |t|
    t.string   "abbrev"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inspections", :force => true do |t|
    t.string   "building_abbrev"
    t.date     "inspection_date"
    t.integer  "floor"
    t.integer  "technician_id"
    t.string   "location"
    t.string   "damper_id"
    t.integer  "damper_status_id"
    t.integer  "damper_type_id"
    t.string   "photo_url"
    t.string   "description"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inspections", ["damper_status_id"], :name => "index_inspections_on_damper_status_id"
  add_index "inspections", ["damper_type_id"], :name => "index_inspections_on_damper_type_id"
  add_index "inspections", ["job_id"], :name => "index_inspections_on_job_id"
  add_index "inspections", ["technician_id"], :name => "index_inspections_on_technician_id"

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.date     "start_date"
    t.date     "finish_date"
    t.string   "inspected_by"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.integer  "contact_phone"
    t.boolean  "active",             :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technicians", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "license"
    t.date     "license_expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "user_type",              :default => "tech", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
