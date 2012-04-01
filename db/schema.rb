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

ActiveRecord::Schema.define(:version => 20120401223224) do

  create_table "damper_statuses", :force => true do |t|
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dampter_types", :force => true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inspections", :force => true do |t|
    t.string   "building_abbrev"
    t.date     "inspection_date"
    t.integer  "floor"
    t.integer  "user_id"
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

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.date     "start_date"
    t.date     "finish_date"
    t.string   "inspected_by"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.integer  "contact_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_types", :force => true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "registration_date"
    t.date     "last_login_date"
    t.date     "account_expiration_date"
    t.string   "license_number"
    t.date     "license_expiration_date"
    t.string   "email"
    t.string   "phone"
    t.integer  "user_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user_type_id"], :name => "index_users_on_user_type_id"

end
