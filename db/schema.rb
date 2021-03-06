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

ActiveRecord::Schema.define(:version => 20150225040544) do

  create_table "admins", :force => true do |t|
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
    t.string   "password_salt"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["authentication_token"], :name => "index_admins_on_authentication_token", :unique => true
  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "fax"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "logo_image_file_name"
    t.string   "logo_image_content_type"
    t.integer  "logo_image_file_size"
    t.datetime "logo_image_updated_at"
  end

  create_table "damper_airstreams", :force => true do |t|
    t.string   "abbrev"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "damper_statuses", :force => true do |t|
    t.string   "abbrev"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "damper_types", :force => true do |t|
    t.string   "abbrev"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "inspections", :force => true do |t|
    t.string   "building_abbrev"
    t.date     "inspection_date"
    t.integer  "floor"
    t.string   "location"
    t.integer  "damper_status_id"
    t.integer  "damper_type_id"
    t.string   "description"
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "damper_image_file_name"
    t.string   "damper_image_content_type"
    t.integer  "damper_image_file_size"
    t.datetime "damper_image_updated_at"
    t.integer  "company_id",                       :default => 0,     :null => false
    t.string   "damper_image_second_file_name"
    t.string   "damper_image_second_content_type"
    t.integer  "damper_image_second_file_size"
    t.datetime "damper_image_second_updated_at"
    t.integer  "damper_airstream_id"
    t.string   "length"
    t.string   "height"
    t.string   "notes"
    t.string   "tag"
    t.integer  "unit"
    t.integer  "damper_id"
    t.boolean  "nonaccessible",                    :default => false, :null => false
    t.boolean  "replace",                          :default => false, :null => false
  end

  add_index "inspections", ["damper_airstream_id"], :name => "index_inspections_on_damper_airstream_id"
  add_index "inspections", ["damper_status_id"], :name => "index_inspections_on_damper_status_id"
  add_index "inspections", ["damper_type_id"], :name => "index_inspections_on_damper_type_id"
  add_index "inspections", ["job_id"], :name => "index_inspections_on_job_id"
  add_index "inspections", ["user_id"], :name => "index_inspections_on_user_id"

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.date     "start_date"
    t.date     "finish_date"
    t.string   "inspected_by"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "contact_phone"
    t.boolean  "active",             :default => true, :null => false
    t.integer  "user_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "company_id",         :default => 0,    :null => false
  end

  add_index "jobs", ["user_id"], :name => "index_jobs_on_user_id"

  create_table "reports", :force => true do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.string   "pdf_report_file_name"
    t.string   "pdf_report_content_type"
    t.integer  "pdf_report_file_size"
    t.datetime "pdf_report_updated_at"
    t.integer  "company_id",               :default => 0, :null => false
  end

  add_index "reports", ["job_id"], :name => "index_reports_on_job_id"
  add_index "reports", ["user_id"], :name => "index_reports_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "role",                       :default => "technician", :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "email",                      :default => "",           :null => false
    t.string   "encrypted_password",         :default => "",           :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "authentication_token"
    t.boolean  "active",                     :default => true,         :null => false
    t.integer  "company_id",                 :default => 0,            :null => false
    t.string   "license_image_file_name"
    t.string   "license_image_content_type"
    t.integer  "license_image_file_size"
    t.datetime "license_image_updated_at"
    t.string   "license"
    t.date     "license_expiration"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["company_id"], :name => "index_users_on_company_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
