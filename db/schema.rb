# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_09_132844) do
  create_table "bug_assignments", force: :cascade do |t|
    t.integer "developer_id", null: false
    t.integer "bug_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bug_id"], name: "index_bug_assignments_on_bug_id"
    t.index ["developer_id"], name: "index_bug_assignments_on_developer_id"
  end

  create_table "bugs", force: :cascade do |t|
    t.string "title"
    t.integer "bug_type", default: 0
    t.integer "status", default: 0
    t.datetime "deadline"
    t.integer "qa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.index ["qa_id"], name: "index_bugs_on_qa_id"
  end

  create_table "project_assignments", force: :cascade do |t|
    t.integer "developer_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_project_assignments_on_developer_id"
    t.index ["project_id"], name: "index_project_assignments_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_projects_on_manager_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bug_assignments", "bugs"
  add_foreign_key "bug_assignments", "users", column: "developer_id"
  add_foreign_key "bugs", "projects"
  add_foreign_key "project_assignments", "projects"
  add_foreign_key "project_assignments", "users", column: "developer_id"
end
