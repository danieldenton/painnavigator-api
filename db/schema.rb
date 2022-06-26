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

ActiveRecord::Schema.define(version: 2022_06_26_184451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "education_module_completions", force: :cascade do |t|
    t.integer "module_id"
    t.integer "status"
    t.integer "user_id"
    t.float "date_time_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_journals", force: :cascade do |t|
    t.integer "user_id"
    t.string "breakfast"
    t.string "lunch"
    t.string "dinner"
    t.string "snacks"
    t.float "date_time_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "body"
    t.integer "status", default: 0
    t.float "date_time_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mood_journals", force: :cascade do |t|
    t.integer "user_id"
    t.string "feeling"
    t.integer "intensity"
    t.string "situation"
    t.string "who_i_was_with"
    t.string "primary_thought"
    t.string "cognitive_distortions"
    t.float "date_time_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movement_module_completions", force: :cascade do |t|
    t.integer "module_id"
    t.integer "status"
    t.integer "user_id"
    t.float "date_time_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pain_journals", force: :cascade do |t|
    t.integer "intensity"
    t.string "situation"
    t.string "feeling"
    t.string "who_i_was_with"
    t.string "coping_strategies"
    t.string "notes"
    t.integer "intensity_after"
    t.integer "user_id"
    t.float "date_time_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pleasant_activities", force: :cascade do |t|
    t.string "activities"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "smart_goal_updates", force: :cascade do |t|
    t.integer "smart_goal_id"
    t.string "goal_update"
    t.float "date_time_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "smart_goals", force: :cascade do |t|
    t.string "goal"
    t.string "steps"
    t.string "reward"
    t.date "end_date"
    t.integer "user_id"
    t.integer "status", default: 0
    t.float "date_time_value"
    t.integer "smart_goal_updates_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "role", default: 0
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.integer "gender"
    t.integer "commitment"
    t.integer "onboard_status", default: 0
    t.integer "profile_status", default: 0
    t.string "phone"
    t.integer "starting_pain_duration"
    t.integer "activity_level"
    t.integer "pace"
    t.integer "starting_pain_score"
    t.string "dob"
    t.string "email"
    t.integer "mood_journals_count"
    t.integer "food_journals_count"
    t.integer "education_modules_count"
    t.integer "movement_modules_count"
    t.integer "bookmarks_count"
    t.integer "smart_goals_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
