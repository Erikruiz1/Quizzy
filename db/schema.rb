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

ActiveRecord::Schema[7.0].define(version: 2023_09_05_090138) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_participations", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_participations_on_game_id"
    t.index ["user_id"], name: "index_game_participations_on_user_id"
  end

  create_table "game_topics", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_topics_on_game_id"
    t.index ["topic_id"], name: "index_game_topics_on_topic_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "difficulty"
    t.integer "number_of_questions"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guesses", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "user_id", null: false
    t.string "content"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_guesses_on_question_id"
    t.index ["user_id"], name: "index_guesses_on_user_id"
  end

  create_table "hints", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "user_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_hints_on_question_id"
    t.index ["user_id"], name: "index_hints_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "content"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "elaborate"
    t.index ["game_id"], name: "index_questions_on_game_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.integer "age"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_participations", "games"
  add_foreign_key "game_participations", "users"
  add_foreign_key "game_topics", "games"
  add_foreign_key "game_topics", "topics"
  add_foreign_key "guesses", "questions"
  add_foreign_key "guesses", "users"
  add_foreign_key "hints", "questions"
  add_foreign_key "hints", "users"
  add_foreign_key "questions", "games"
end
