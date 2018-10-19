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

ActiveRecord::Schema.define(version: 2010_05_25_173430) do

  create_table "complex_dates", force: :cascade do |t|
    t.integer "year"
    t.integer "year_certainty_id"
    t.integer "season_id"
    t.integer "season_certainty_id"
    t.integer "month"
    t.integer "month_certainty_id"
    t.integer "day"
    t.integer "day_certainty_id"
    t.integer "day_of_week_id"
    t.integer "day_of_week_certainty_id"
    t.integer "time_of_day_id"
    t.integer "time_of_day_certainty_id"
    t.integer "hour"
    t.integer "hour_certainty_id"
    t.integer "minute"
    t.integer "minute_certainty_id"
    t.integer "animal_id"
    t.integer "animal_certainty_id"
    t.integer "calendrical_id"
    t.integer "calendrical_certainty_id"
    t.integer "element_certainty_id"
    t.integer "element_id"
    t.integer "gender_id"
    t.integer "gender_certainty_id"
    t.integer "intercalary_month_id"
    t.integer "intercalary_day_id"
    t.integer "rabjung_id"
    t.integer "rabjung_certainty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year_end"
    t.integer "season_end_id"
    t.integer "month_end"
    t.integer "day_end"
    t.integer "day_of_week_end_id"
    t.integer "time_of_day_end_id"
    t.integer "hour_end"
    t.integer "minute_end"
    t.integer "rabjung_end_id"
    t.integer "intercalary_month_end_id"
    t.integer "intercalary_day_end_id"
  end

  create_table "time_units", force: :cascade do |t|
    t.integer "date_id"
    t.integer "start_date_id"
    t.integer "end_date_id"
    t.integer "calendar_id"
    t.boolean "is_range"
    t.integer "dateable_id"
    t.string "dateable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "frequency_id"
  end

end
