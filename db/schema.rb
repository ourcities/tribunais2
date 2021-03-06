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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150424191447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], :name => "delayed_jobs_priority"
  end

  create_table "organizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.text     "email_signature_html"
  end

  create_table "tasks", force: true do |t|
    t.string   "mailchimp_list_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",                                                                    null: false
    t.string   "name",                                                                        null: false
    t.string   "mission",                                                                     null: false
    t.string   "slug",                                                                        null: false
    t.text     "description",        default: "Altere este texto para a descrição da tarefa", null: false
    t.index ["position"], :name => "index_tasks_on_position"
    t.index ["slug"], :name => "index_tasks_on_slug", :unique => true
  end

  create_table "task_accomplishments", force: true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["task_id"], :name => "fk__task_accomplishments_task_id"
    t.foreign_key ["task_id"], "tasks", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_task_accomplishments_task_id"
  end

  create_table "users", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "ip"
    t.integer "organization_id"
    t.index ["organization_id"], :name => "fk__users_organization_id"
    t.foreign_key ["organization_id"], "organizations", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_users_organization_id"
  end

end
