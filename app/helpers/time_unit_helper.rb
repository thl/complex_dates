module TimeUnitHelper
  def display_tibetan_date(date)
    tibetan_date_formate = "#{date.tibetan_hour}"
    tibetan_date_formate += ":" unless date.tibetan_hour.blank?
    tibetan_date_formate += "#{date.tibetan_minute}" unless date.tibetan_minute.blank?
    tibetan_date_formate += "#{date.tibetan_am_pm.upcase}" unless date.tibetan_hour.blank?
    tibetan_date_formate += "(#{date.tibetan_hour_certainty})" if date.tibetan_hour_certainty == "Probable" or date.tibetan_hour_certainty == "Estimated"
    tibetan_date_formate += ", " 
    tibetan_date_formate += "#{date.tibetan_day}<sup>#{TimeUnit.sufix_dates(date.tibetan_day)}</sup>" unless date.tibetan_day.blank?
    tibetan_date_formate += "(#{date.tibetan_day_certainty})" if date.tibetan_day_certainty == "Probable" or date.tibetan_day_certainty == "Estimated"
    tibetan_date_formate += " of #{date.tibetan_month}<sup>#{TimeUnit.sufix_dates(date.tibetan_month)}</sup> month" unless date.tibetan_month.blank?
    tibetan_date_formate += "(#{date.tibetan_month_certainty})" if date.tibetan_month_certainty == "Probable" or date.tibetan_month_certainty == "Estimated"
    tibetan_date_formate += "," unless date.tibetan_day.blank? or date.tibetan_month.blank?
    tibetan_date_formate += " the " unless date.gender.blank? or date.element.blank? or date.animal.blank?
    tibetan_date_formate += "#{date.gender}" unless date.gender.blank?
    tibetan_date_formate += "(#{date.gender_certainty})" if date.gender_certainty == "Probable" or date.gender_certainty == "Estimated"
    tibetan_date_formate += " #{date.element}" unless date.element.blank?
    tibetan_date_formate += "(#{date.element_certainty})" if date.element_certainty == "Probable" or date.element_certainty == "Estimated"
    tibetan_date_formate += "-" unless date.element.blank? and date.animal.blank?
    tibetan_date_formate += "#{date.animal}" unless date.animal.blank?
    tibetan_date_formate += "(#{date.animal_certainty})" if date.animal_certainty == "Probable" or date.animal_certainty == "Estimated"
    tibetan_date_formate += " of the " unless date.rabjung.blank? or date.calendrical.blank?
    tibetan_date_formate += "#{date.rabjung}<sup>#{TimeUnit.sufix_dates(date.rabjung)}</sup> rabjung" unless date.rabjung.blank?
    tibetan_date_formate += "(#{date.rabjung_certainty})" if date.rabjung_certainty == "Probable" or date.rabjung_certainty == "Estimated"
    tibetan_date_formate += "(#{date.calendrical})" unless date.calendrical.blank?
   tibetan_date_formate
  end
  
  def display_gregorian_date(date)
    gregorian_date_formate = "#{date.gregorian_hour}" unless date.gregorian_hour.blank?
    gregorian_date_formate += ":" unless date.gregorian_hour.blank? and date.gregorian_minute.blank?
    gregorian_date_formate +=  "#{date.gregorian_minute}" unless date.gregorian_minute.blank? 
    gregorian_date_formate += "#{date.gregorian_am_pm.upcase} " unless date.gregorian_hour.blank?
    gregorian_date_formate += "(#{date.gregorian_hour_certainty})" if date.gregorian_hour_certainty == "Probable" or date.gregorian_hour_certainty == "Estimated"
    gregorian_date_formate += ", " unless date.gregorian_hour.blank? and date.gregorina_minute.blank?
    gregorian_date_formate += "#{TimeUnit.month_string date.gregorian_month}" unless date.gregorian_month.blank?
    gregorian_date_formate += "(#{date.gregorian_month_certainty})" if date.gregorian_month_certainty == "Probable" or date.gregorian_month_certainty == "Estimated"
    gregorian_date_formate += " #{date.gregorian_day}<sup>#{TimeUnit.sufix_dates date.gregorian_day}</sup>" unless date.gregorian_day.blank?
    gregorian_date_formate += "(#{date.gregorian_day_certainty})" if date.gregorian_day_certainty == "Probable" or date.gregorian_day_certainty == "Estimated"
    gregorian_date_formate += "(#{date.gregorian_day_of_week})" unless date.gregorian_day_of_week.blank?
    gregorian_date_formate += ", " unless date.gregorian_month.blank? and date.gregorian_day.blank? and date.gregorian_day_of_week.blank? and date.gregorian_year.blank? 
    gregorian_date_formate += "#{date.gregorian_year}" unless date.gregorian_year.blank?
    gregorian_date_formate
  end
  
  def display_gregorian_range_date(date)
  gregorian_date_formate = "#{date.gregorian_start_hour}"
  gregorian_date_formate += ":" unless date.gregorian_start_hour.blank? and date.gregorian_start_minute.blank?
  gregorian_date_formate += "#{date.gregorian_start_minute}" unless date.gregorian_start_minute.blank?
  gregorian_date_formate += "#{date.start_am_pm.upcase}" unless date.gregorian_start_hour.blank?
  gregorian_date_formate += "-" unless date.gregorian_start_hour.blank? and date.gregorian_start_minute.blank? and date.gregorian_end_hour.blank? and date.gregorian_end_minute.blank?
  gregorian_date_formate += "#{date.gregorian_end_hour}" unless date.gregorian_end_hour.blank?
  gregorian_date_formate += ":" unless date.gregorian_end_hour.blank? and date.gregorian_end_minute.blank?
  gregorian_date_formate += "#{date.gregorian_end_minute}" unless date.gregorian_end_minute.blank?
  gregorian_date_formate += "#{date.end_am_pm.upcase}" unless date.gregorian_end_hour.blank?
  gregorian_date_formate += "(#{date.gregorian_hour_certainty})" if date.gregorian_hour_certainty == "Probable" or  date.gregorian_hour_certainty == "Estimated"
  gregorian_date_formate += "," unless date.gregorian_start_hour.blank? and date.gregorian_end_hour.blank? and date.gregorian_start_minute and date.gregorian_end_minute
  gregorian_date_formate += " #{TimeUnit.month_string date.gregorian_start_month}"
  gregorian_date_formate += "(#{date.gregorian_month_certainty})" if date.gregorian_month_certainty == "Probable" or  date.gregorian_month_certainty == "Estimated"
  gregorian_date_formate += " #{date.gregorian_start_day}<sup>#{TimeUnit.sufix_dates(date.gregorian_start_day)}</sup>" unless date.gregorian_start_day.blank?
  gregorian_date_formate += "(#{date.gregorian_day_certainty})" if date.gregorian_day_certainty == "Probable" or  date.gregorian_day_certainty == "Estimated"
  gregorian_date_formate += " (#{date.gregorian_start_day_of_week})" unless date.gregorian_start_day_of_week.blank?
  gregorian_date_formate += "(#{date.gregorian_day_of_week_certainty})" if date.gregorian_day_of_week_certainty == "Probable" or  date.gregorian_day_of_week_certainty == "Estimated"
  gregorian_date_formate += ", #{date.gregorian_start_year}" unless date.gregorian_start_year.blank?
  gregorian_date_formate += "(#{date.gregorian_year_certainty})" if date.gregorian_year_certainty == "Probable" or  date.gregorian_year_certainty == "Estimated"
  gregorian_date_formate += " - " unless date.gregorian_end_month.blank? and date.gregorian_end_day.blank? and date.gregorian_end_day_of_week.blank? and date.gregorian_end_year.blank?
  gregorian_date_formate += " #{TimeUnit.month_string date.gregorian_end_month}"
   gregorian_date_formate += " #{date.gregorian_end_day}<sup>#{TimeUnit.sufix_dates(date.gregorian_end_day)}</sup>" unless date.gregorian_start_day.blank?
   gregorian_date_formate += " (#{date.gregorian_end_day_of_week})" unless date.gregorian_end_day_of_week.blank?
   gregorian_date_formate += ", #{date.gregorian_end_year}" unless date.gregorian_end_year.blank?
  gregorian_date_formate 
  end
  
  def display_tibetan_range_date(date)
    tibetan_date_formate ="#{date.tibetan_start_hour}" 
    tibetan_date_formate += ":" unless date.tibetan_start_hour.blank?
    tibetan_date_formate += "#{date.tibetan_start_minute}" unless date.tibetan_start_minute.blank?
    tibetan_date_formate += " #{date.tibetan_first_am_pm.upcase}" unless date.tibetan_start_hour.blank?
    tibetan_date_formate += " - #{date.tibetan_end_hour}" unless date.tibetan_end_hour.blank?
    tibetan_date_formate += ":" unless date.tibetan_end_hour.blank?
    tibetan_date_formate += "#{date.tibetan_end_minute}" unless date.tibetan_start_minute.blank?
    tibetan_date_formate += " #{date.tibetan_end_am_pm.upcase}" unless date.tibetan_end_hour.blank?
    tibetan_date_formate += "(#{date.tibetan_hour_certainty})" if date.tibetan_hour_certainty == "Probable" or date.tibetan_hour_certainty == "Estimated"
    tibetan_date_formate += ", " unless date.tibetan_start_hour.blank? or date.tibetan_end_hour.blank?
    tibetan_date_formate += " #{date.tibetan_start_day}<sup>#{TimeUnit.sufix_dates(date.tibetan_start_day)}</sup> of the" unless date.tibetan_start_day.blank?
    tibetan_date_formate += " #{date.tibetan_start_month}<sup>#{TimeUnit.sufix_dates(date.tibetan_start_month)}</sup> month" if date.tibetan_start_month
    tibetan_date_formate += " - " unless date.tibetan_end_day.blank? or date.tibetan_end_month.blank?
    tibetan_date_formate += "#{date.tibetan_end_day}<sup>#{TimeUnit.sufix_dates(date.tibetan_end_day)}</sup> of the" unless date.tibetan_end_day.blank?
    tibetan_date_formate += " #{date.tibetan_end_month}<sup>#{TimeUnit.sufix_dates(date.tibetan_end_month)}</sup> month" unless date.tibetan_start_month.blank?
    tibetan_date_formate += "(#{date.tibetan_month_certainty})" if date.tibetan_month_certainty == "Probable" or date.tibetan_month_certainty == "Estimated"
    tibetan_date_formate += "," unless date.tibetan_end_month.blank? or date.tibetan_start_month.blank?
    tibetan_date_formate += " the " unless date.gender.blank? or date.element.blank? or date.animal.blank? or date.rabjung_start.blank?
    tibetan_date_formate += "#{date.gender}" unless date.gender.blank?
    tibetan_date_formate += "(#{date.gender_certainty})" if date.gender_certainty == "Probable" or date.gender_certainty == "Estimated"
    tibetan_date_formate += " #{date.element}" unless date.element.blank?
    tibetan_date_formate += "(#{date.element_certainty})" if date.element_certainty == "Probable" or date.element_certainty == "Estimated"
    tibetan_date_formate += "-" unless date.element.blank? and date.animal.blank?
    tibetan_date_formate += "#{date.animal}" unless date.animal.blank?
    tibetan_date_formate += "(#{date.animal_certainty})" if date.animal_certainty == "Probable" or date.animal_certainty == "Estimated"
    tibetan_date_formate += " year of the " unless date.rabjung_start.blank? or date.rabjung_end.blank? or date.calendrical.blank?
    tibetan_date_formate += "#{date.rabjung_start}<sup>#{TimeUnit.sufix_dates(date.rabjung_start)}</sup>" unless date.rabjung_start.blank?
    tibetan_date_formate += "-#{date.rabjung_end}<sup>#{TimeUnit.sufix_dates(date.rabjung_end)}</sup> rabjung" unless date.rabjung_end.blank?
    tibetan_date_formate += "(#{date.rabjung_certainty})" if date.rabjung_certainty == "Probable" or date.rabjung_certainty == "Estimated"
    tibetan_date_formate += "(#{date.calendrical})" unless date.calendrical.blank?
    tibetan_date_formate
  end
end
