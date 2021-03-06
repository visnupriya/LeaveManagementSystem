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

ActiveRecord::Schema.define(:version => 20111122072821) do

  create_table "admins", :force => true do |t|
    t.string   "token"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "emp_name"
    t.string   "emp_emailid"
    t.integer  "emp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "depts", :force => true do |t|
    t.string   "department"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "depts", ["user_id"], :name => "index_depts_on_user_id"

  create_table "emps", :force => true do |t|
    t.string   "name"
    t.string   "emailid"
    t.string   "dateofjoining"
    t.string   "position"
    t.integer  "dept_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emps", ["dept_id"], :name => "index_emps_on_dept_id"

  create_table "forms", :force => true do |t|
    t.string   "leavetype"
    t.string   "from"
    t.string   "to"
    t.text     "reason"
    t.string   "emp_name"
    t.string   "emp_emailid"
    t.integer  "emp_id"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "sender_id"
    t.string   "recipient_email"
    t.string   "token"
    t.datetime "sent_at"
    t.integer  "emp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "session1s", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "companyname"
    t.string   "hrname"
    t.integer  "invitation_id"
    t.integer  "invitation_limit"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
