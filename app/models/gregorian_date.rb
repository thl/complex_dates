# id: integer
# gregorian_year: string
# gregorian_year_certainty: string
# gregorian_month: string
# gregorian_month_certainty: string
# gregorian_day: string
# gregorian_day_certainty: string
# gregorian_day_of_week: string
# gregorian_day_of_week_certainty: string
# gregorian_season: string
# gregorian_season_certainty: string
# gregorian_hour: integer
# gregorian_hour_certainty: string
# gregorian_minute: integer
# gregorian_minute_certainty: string
# gregorian_time_of_day: integer
# gregorian_time_of_day_certainty: string
# gregorian_am_pm: string
# gregorian_am_pm_certainty: string
# time_unit_id: integer
# created_at: timestamp
# updated_at: timestamp

class GregorianDate < ActiveRecord::Base
  belongs_to :time_unit, :class_name => "TimeUnit", :foreign_key => "time_unit_id"
end
