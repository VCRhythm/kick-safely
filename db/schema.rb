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

ActiveRecord::Schema.define(:version => 20130305224917) do

  create_table "approvals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "approvals", ["project_id"], :name => "index_approvals_on_project_id"
  add_index "approvals", ["user_id", "project_id"], :name => "index_approvals_on_user_id_and_project_id", :unique => true
  add_index "approvals", ["user_id"], :name => "index_approvals_on_user_id"

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "factors", :force => true do |t|
    t.string   "name"
    t.integer  "effect"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "owner"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "category"
    t.string   "handle"
    t.string   "thumbnail_url"
    t.integer  "pledge_percent"
    t.text     "description"
    t.integer  "score"
    t.boolean  "video"
    t.boolean  "featured"
    t.string   "pledge_deadline"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "skills_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "skill_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
