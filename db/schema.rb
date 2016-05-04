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

ActiveRecord::Schema.define(version: 20160504083909) do

  create_table "answers", force: :cascade do |t|
    t.integer  "stack_id"
    t.integer  "sender_id"
    t.text     "answer",                     null: false
    t.boolean  "work",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "answers", ["sender_id"], name: "index_answers_on_sender_id"
  add_index "answers", ["stack_id"], name: "index_answers_on_stack_id"

  create_table "contributors", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "project_id", null: false
  end

  add_index "contributors", ["project_id", "user_id"], name: "index_contributors_on_project_id_and_user_id"
  add_index "contributors", ["user_id", "project_id"], name: "index_contributors_on_user_id_and_project_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "hearts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hearts", ["post_id"], name: "index_hearts_on_post_id"
  add_index "hearts", ["user_id"], name: "index_hearts_on_user_id"

  create_table "missions", force: :cascade do |t|
    t.integer  "project_id"
    t.boolean  "complete"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "missions", ["project_id"], name: "index_missions_on_project_id"

  create_table "missions_projects", id: false, force: :cascade do |t|
    t.integer "mission_id", null: false
    t.integer "project_id", null: false
  end

  add_index "missions_projects", ["mission_id", "project_id"], name: "index_missions_projects_on_mission_id_and_project_id"
  add_index "missions_projects", ["project_id", "mission_id"], name: "index_missions_projects_on_project_id_and_mission_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.integer  "author_id"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id"
  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender",       default: 1, null: false
    t.integer  "user_id"
    t.string   "fb_link"
    t.string   "twitter_link"
    t.string   "github_link"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.integer  "author_id"
  end

  add_index "projects", ["author_id"], name: "index_projects_on_author_id"

  create_table "resources", force: :cascade do |t|
    t.string   "location"
    t.integer  "suppliers_id"
    t.string   "suppliers_type"
    t.decimal  "price",          precision: 5, scale: 2
    t.decimal  "rent_price",     precision: 5, scale: 2
    t.integer  "stock",                                  default: 1
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "resources", ["suppliers_type", "suppliers_id"], name: "index_resources_on_suppliers_type_and_suppliers_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "stacks", force: :cascade do |t|
    t.text     "content"
    t.integer  "stucker_id"
    t.string   "stucker_type"
    t.integer  "answers_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "stacks", ["stucker_type", "stucker_id"], name: "index_stacks_on_stucker_type_and_stucker_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "content"
    t.boolean  "done"
    t.integer  "tasker_id"
    t.string   "tasker_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tasks", ["tasker_type", "tasker_id"], name: "index_tasks_on_tasker_type_and_tasker_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "username",               limit: 30
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

  create_table "workers", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "mission_id", null: false
  end

  add_index "workers", ["mission_id", "user_id"], name: "index_workers_on_mission_id_and_user_id"
  add_index "workers", ["user_id", "mission_id"], name: "index_workers_on_user_id_and_mission_id"

end
