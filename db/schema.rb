# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090927180949) do

  create_table "gregorian_dates", :force => true do |t|
    t.string   "gregorian_year"
    t.string   "gregorian_year_certainty",        :default => "Certain"
    t.string   "gregorian_month"
    t.string   "gregorian_month_certainty",       :default => "Certain"
    t.string   "gregorian_day"
    t.string   "gregorian_day_certainty",         :default => "Certain"
    t.string   "gregorian_day_of_week"
    t.string   "gregorian_day_of_week_certainty", :default => "Certain"
    t.string   "gregorian_season"
    t.string   "gregorian_season_certainty",      :default => "Certain"
    t.integer  "gregorian_hour"
    t.string   "gregorian_hour_certainty",        :default => "Certain"
    t.integer  "gregorian_minute"
    t.string   "gregorian_minute_certainty",      :default => "Certain"
    t.integer  "gregorian_time_of_day"
    t.string   "gregorian_time_of_day_certainty", :default => "Certain"
    t.string   "gregorian_am_pm"
    t.string   "gregorian_am_pm_certainty",       :default => "Certain"
    t.integer  "time_unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gregorian_range_dates", :force => true do |t|
    t.string   "gregorian_start_year"
    t.string   "gregorian_end_year"
    t.string   "gregorian_year_certainty",        :default => "Certain"
    t.string   "gregorian_start_month"
    t.string   "gregorian_end_month"
    t.string   "gregorian_month_certainty",       :default => "Certain"
    t.string   "gregorian_start_day"
    t.string   "gregorian_end_day"
    t.string   "gregorian_day_certainty",         :default => "Certain"
    t.string   "gregorian_start_day_of_week"
    t.string   "gregorian_end_day_of_week"
    t.string   "gregorian_day_of_week_certainty", :default => "Certain"
    t.string   "gregorian_start_season"
    t.string   "gregorian_end_season"
    t.string   "gregorian_season_certainty",      :default => "Certain"
    t.integer  "gregorian_start_hour"
    t.integer  "gregorian_end_hour"
    t.string   "gregorian_hour_certainty",        :default => "Certain"
    t.integer  "gregorian_start_minute"
    t.integer  "gregorian_end_minute"
    t.string   "gregorian_minute_certainty",      :default => "Certain"
    t.integer  "gregorian_start_time_of_day"
    t.integer  "gregorian_end_time_of_day"
    t.string   "gregorian_time_of_day_certainty", :default => "Certain"
    t.string   "start_am_pm"
    t.string   "end_am_pm"
    t.string   "am_pm_certainty",                 :default => "Certain"
    t.integer  "time_unit_id"
    t.boolean  "start_range",                     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tibetan_dates", :force => true do |t|
    t.string   "calendrical"
    t.string   "calendrical_certainty",               :default => "Certain"
    t.integer  "rabjung"
    t.string   "rabjung_certainty",                   :default => "Certain"
    t.string   "element"
    t.string   "element_certainty",                   :default => "Certain"
    t.string   "animal"
    t.string   "animal_certainty",                    :default => "Certain"
    t.string   "gender"
    t.string   "gender_certainty",                    :default => "Certain"
    t.integer  "tibetan_month"
    t.string   "tibetan_month_certainty",             :default => "Certain"
    t.string   "tibetan_intercalary_month"
    t.string   "tibetan_intercalary_month_certainty", :default => "Certain"
    t.string   "tibetan_day"
    t.string   "tibetan_day_certainty",               :default => "Certain"
    t.string   "tibetan_intercalary_day"
    t.string   "tibetan_intercalary_day_certainty",   :default => "Certain"
    t.integer  "tibetan_hour"
    t.string   "tibetan_hour_certainty",              :default => "Certain"
    t.integer  "tibetan_minute"
    t.string   "tibetan_minute_certainty",            :default => "Certain"
    t.integer  "tibetan_time_of_day"
    t.string   "tibetan_time_of_day_certainty",       :default => "Certain"
    t.string   "tibetan_am_pm"
    t.string   "tibetan_am_pm_certainty",             :default => "Certain"
    t.integer  "time_unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tibetan_range_dates", :force => true do |t|
    t.string   "calendrical"
    t.string   "calendrical_certainty",               :default => "Certain"
    t.integer  "rabjung_start"
    t.integer  "rabjung_end"
    t.string   "rabjung_certainty",                   :default => "Certain"
    t.string   "element"
    t.string   "element_certainty",                   :default => "Certain"
    t.string   "animal"
    t.string   "animal_certainty",                    :default => "Certain"
    t.string   "gender"
    t.string   "gender_certainty",                    :default => "Certain"
    t.integer  "tibetan_start_month"
    t.integer  "tibetan_end_month"
    t.string   "tibetan_month_certainty",             :default => "Certain"
    t.string   "tibetan_intercalary_month"
    t.string   "tibetan_intercalary_month_certainty", :default => "Certain"
    t.string   "tibetan_start_day"
    t.string   "tibetan_end_day"
    t.string   "tibetan_day_certainty",               :default => "Certain"
    t.string   "tibetan_intercalary_day"
    t.string   "tibetan_intercalary_day_certainty",   :default => "Certain"
    t.integer  "tibetan_start_hour"
    t.integer  "tibetan_end_hour"
    t.string   "tibetan_hour_certainty",              :default => "Certain"
    t.integer  "tibetan_start_minute"
    t.integer  "tibetan_end_minute"
    t.string   "tibetan_minute_certainty",            :default => "Certain"
    t.integer  "tibetan_start_time_of_day"
    t.integer  "tibetan_end_time_of_day"
    t.string   "tibetan_time_of_day_certainty",       :default => "Certain"
    t.string   "tibetan_first_am_pm"
    t.string   "tibetan_end_am_pm"
    t.string   "tibetan_am_pm_certainty",             :default => "Certain"
    t.integer  "time_unit_id"
    t.boolean  "start_range",                         :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_units", :force => true do |t|
    t.string   "point_range"
    t.string   "date_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
