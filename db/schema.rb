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

ActiveRecord::Schema.define(version: 20170424001625) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "content"
    t.boolean  "right"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.string   "bootsy_resource_type"
    t.integer  "bootsy_resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exams", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.boolean  "status"
    t.boolean  "doubt"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "participant_id"
    t.index ["answer_id"], name: "index_exams_on_answer_id"
    t.index ["participant_id"], name: "index_exams_on_participant_id"
    t.index ["question_id"], name: "index_exams_on_question_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "q_list"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "status",     default: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email"
  end

end
