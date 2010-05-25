class TibetanDate < ComplexDate
  
  def is_range
    false
  end
  
  def calendar_id
    2
  end
end

# == Schema Info
# Schema version: 20100525173430
#
# Table name: complex_dates
#
#  id                       :integer         not null, primary key
#  animal_certainty_id      :integer
#  animal_id                :integer
#  calendrical_certainty_id :integer
#  calendrical_id           :integer
#  day_certainty_id         :integer
#  day_of_week_certainty_id :integer
#  day_of_week_end_id       :integer
#  day_of_week_id           :integer
#  element_certainty_id     :integer
#  element_id               :integer
#  gender_certainty_id      :integer
#  gender_id                :integer
#  hour_certainty_id        :integer
#  intercalary_day_end_id   :integer
#  intercalary_day_id       :integer
#  intercalary_month_end_id :integer
#  intercalary_month_id     :integer
#  minute_certainty_id      :integer
#  month_certainty_id       :integer
#  rabjung_certainty_id     :integer
#  rabjung_end_id           :integer
#  rabjung_id               :integer
#  season_certainty_id      :integer
#  season_end_id            :integer
#  season_id                :integer
#  time_of_day_certainty_id :integer
#  time_of_day_end_id       :integer
#  time_of_day_id           :integer
#  year_certainty_id        :integer
#  day                      :integer
#  day_end                  :integer
#  hour                     :integer
#  hour_end                 :integer
#  minute                   :integer
#  minute_end               :integer
#  month                    :integer
#  month_end                :integer
#  year                     :integer
#  year_end                 :integer
#  created_at               :timestamp
#  updated_at               :timestamp