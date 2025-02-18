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

ActiveRecord::Schema.define(version: 2024_06_10_180609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "daily_pain_scores", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "score"
    t.bigint "date_time_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id_copy_for_admin"
  end

  create_table "education_module_completions", force: :cascade do |t|
    t.integer "module_id"
    t.integer "status"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "education_progress"
  end

  create_table "education_modules", force: :cascade do |t|
    t.integer "module_id"
    t.integer "module_type"
    t.string "name"
    t.integer "length"
    t.string "post_completion_destination"
    t.string "source"
    t.integer "skippable"
    t.string "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "education_units", force: :cascade do |t|
    t.integer "saved", default: [], array: true
    t.integer "skipped", default: [], array: true
    t.integer "completed", default: [], array: true
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
    t.string "created"
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
    t.string "created"
  end

  create_table "movement_module_completions", force: :cascade do |t|
    t.integer "module_id"
    t.integer "status"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "video_id"
  end

  create_table "movement_units", force: :cascade do |t|
    t.integer "saved", default: [], array: true
    t.integer "skipped", default: [], array: true
    t.integer "completed", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "onboards", force: :cascade do |t|
    t.integer "starting_pain_score"
    t.integer "enjoyment_of_life"
    t.integer "activity_interference"
    t.string "hopes_to_achieve"
    t.string "anxious"
    t.string "unable_to_stop_worrying"
    t.string "little_interest_or_pleasure"
    t.string "depressed"
    t.string "type_of_pain"
    t.string "pain_injections"
    t.string "spine_surgery"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_onboards_on_user_id"
  end

  create_table "outcomes", force: :cascade do |t|
    t.integer "recommendation"
    t.integer "outcome_enjoyment_of_life"
    t.integer "outcome_activity_interference"
    t.string "outcome_anxious"
    t.string "outcome_unable_to_stop_worrying"
    t.string "outcome_little_interest_or_pleasure"
    t.string "outcome_depressed"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_outcomes_on_user_id"
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
    t.string "created"
    t.integer "time_stamp"
  end

  create_table "pleasant_activities", force: :cascade do |t|
    t.string "activities"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "provider_dashboards", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_provider_dashboards_on_email", unique: true
    t.index ["reset_password_token"], name: "index_provider_dashboards_on_reset_password_token", unique: true
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "users_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "condensed_program", default: false
    t.string "email"
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
    t.string "meaning"
    t.string "challenges"
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
    t.integer "provider_id"
    t.integer "wellness_coach_id"
    t.boolean "has_unreplied_message", default: false
    t.string "expo_push_token"
    t.boolean "completed_program", default: false
    t.integer "enjoyment_of_life"
    t.integer "activity_interference"
    t.string "hopes_to_achieve"
    t.integer "recommendation"
    t.integer "outcome_enjoyment_of_life"
    t.integer "outcome_activity_interference"
    t.string "outcome_anxious"
    t.string "outcome_unable_to_stop_worrying"
    t.string "outcome_little_interest_or_pleasure"
    t.string "outcome_depressed"
    t.string "depressed"
    t.string "anxious"
    t.string "unable_to_stop_worrying"
    t.string "little_interest_or_pleasure"
    t.string "pain_injections"
    t.string "spine_surgery"
    t.integer "education_program", default: 1
    t.string "dates_on_app", default: [], array: true
    t.string "last_date_on_app"
    t.string "type_of_pain"
    t.integer "saved_movement_units", default: [], array: true
    t.integer "skipped_movement_units", default: [], array: true
    t.integer "completed_movement_units", default: [], array: true
    t.boolean "opt_out_sms", default: false
    t.integer "wellness_coach_reminder", default: 0
    t.boolean "wellness_coach_reminded", default: true
    t.boolean "app_update_required", default: false
    t.string "app_version"
  end

  create_table "wellness_coaches", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_wellness_coaches_on_email", unique: true
    t.index ["reset_password_token"], name: "index_wellness_coaches_on_reset_password_token", unique: true
  end

  add_foreign_key "onboards", "users"
  add_foreign_key "outcomes", "users"
end
