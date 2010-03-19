module TimeUnitHelper
  def display_tibetan_date(date)
    intercalary_month_suffix = case date.tibetan_intercalary_month
      when "secondary" then "a"
      when "tertiary" then "b"
      else ""
    end
    intercalary_day_suffix = case date.tibetan_intercalary_day
      when "secondary" then "a"
      when "tertiary" then "b"
      else ""
    end
    
    tibetan_date_formate = "#{date.tibetan_hour}"
    tibetan_date_formate += ":" unless date.tibetan_hour.blank?
    tibetan_date_formate += format_minute(date.tibetan_minute) unless date.tibetan_minute.blank?
    tibetan_date_formate += "#{date.tibetan_am_pm.upcase}" unless date.tibetan_hour.blank?
    tibetan_date_formate += "(#{date.tibetan_hour_certainty})" if date.tibetan_hour_certainty == "Probable" or date.tibetan_hour_certainty == "Estimated"
    tibetan_date_formate += ", " 
    tibetan_date_formate += "#{date.tibetan_day}#{intercalary_day_suffix}<sup>#{TimeUnit.suffix_dates(date.tibetan_day)}</sup>" unless date.tibetan_day.blank?
    tibetan_date_formate += "(#{date.tibetan_day_certainty})" if date.tibetan_day_certainty == "Probable" or date.tibetan_day_certainty == "Estimated"
    tibetan_date_formate += " of the #{date.tibetan_month}#{intercalary_month_suffix}<sup>#{TimeUnit.suffix_dates(date.tibetan_month)}</sup> month" unless date.tibetan_month.blank?
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
    tibetan_date_formate += "#{date.rabjung}<sup>#{TimeUnit.suffix_dates(date.rabjung)}</sup> sixty-cycle" unless date.rabjung.blank?
    tibetan_date_formate += "(#{date.rabjung_certainty})" if date.rabjung_certainty == "Probable" or date.rabjung_certainty == "Estimated"
    tibetan_date_formate += " (#{date.calendrical})" unless date.calendrical.blank?
   tibetan_date_formate
  end
  
  def display_gregorian_date(date)
    gregorian_date_formate = "#{date.gregorian_hour}" unless date.gregorian_hour.blank?
    gregorian_date_formate += ":" unless date.gregorian_hour.blank? and date.gregorian_minute.blank?
    gregorian_date_formate +=  format_minute(date.gregorian_minute) unless date.gregorian_minute.blank? 
    gregorian_date_formate += "#{date.gregorian_am_pm.upcase}" unless date.gregorian_hour.blank?
    gregorian_date_formate += " (#{date.gregorian_hour_certainty})" if date.gregorian_hour_certainty == "Probable" or date.gregorian_hour_certainty == "Estimated"
    gregorian_date_formate += ", " unless date.gregorian_hour.blank? and date.gregorina_minute.blank?
    gregorian_date_formate += "#{TimeUnit.month_string date.gregorian_month}" unless date.gregorian_month.blank?
    gregorian_date_formate += "(#{date.gregorian_month_certainty})" if date.gregorian_month_certainty == "Probable" or date.gregorian_month_certainty == "Estimated"
    gregorian_date_formate += " #{date.gregorian_day}<sup>#{TimeUnit.suffix_dates date.gregorian_day}</sup>" unless date.gregorian_day.blank?
    gregorian_date_formate += "(#{date.gregorian_day_certainty})" if date.gregorian_day_certainty == "Probable" or date.gregorian_day_certainty == "Estimated"
    gregorian_date_formate += " (#{date.gregorian_day_of_week})" unless date.gregorian_day_of_week.blank?
    #gregorian_date_formate += ", " unless date.gregorian_month.blank? and date.gregorian_day.blank? and date.gregorian_day_of_week.blank? and date.gregorian_year.blank? 
    gregorian_date_formate += ", #{date.gregorian_year}" unless date.gregorian_year.blank?
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
  gregorian_date_formate += " #{date.gregorian_start_day}<sup>#{TimeUnit.suffix_dates(date.gregorian_start_day)}</sup>" unless date.gregorian_start_day.blank?
  gregorian_date_formate += "(#{date.gregorian_day_certainty})" if date.gregorian_day_certainty == "Probable" or  date.gregorian_day_certainty == "Estimated"
  gregorian_date_formate += " (#{date.gregorian_start_day_of_week})" unless date.gregorian_start_day_of_week.blank?
  gregorian_date_formate += "(#{date.gregorian_day_of_week_certainty})" if date.gregorian_day_of_week_certainty == "Probable" or  date.gregorian_day_of_week_certainty == "Estimated"
  gregorian_date_formate += ", #{date.gregorian_start_year}" unless date.gregorian_start_year.blank?
  gregorian_date_formate += "(#{date.gregorian_year_certainty})" if date.gregorian_year_certainty == "Probable" or  date.gregorian_year_certainty == "Estimated"
  gregorian_date_formate += " - " unless date.gregorian_end_month.blank? and date.gregorian_end_day.blank? and date.gregorian_end_day_of_week.blank? and date.gregorian_end_year.blank?
  gregorian_date_formate += " #{TimeUnit.month_string date.gregorian_end_month}"
   gregorian_date_formate += " #{date.gregorian_end_day}<sup>#{TimeUnit.suffix_dates(date.gregorian_end_day)}</sup>" unless date.gregorian_start_day.blank?
   gregorian_date_formate += " (#{date.gregorian_end_day_of_week})" unless date.gregorian_end_day_of_week.blank?
   gregorian_date_formate += ", #{date.gregorian_end_year}" unless date.gregorian_end_year.blank?
  gregorian_date_formate 
  end
  
  def display_tibetan_range_date(date)
    intercalary_month_suffix = case date.tibetan_intercalary_month
      when "secondary" then "a"
      when "tertiary" then "b"
      else ""
    end
    intercalary_day_suffix = case date.tibetan_intercalary_day
      when "secondary" then "a"
      when "tertiary" then "b"
      else ""
    end
  
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
    tibetan_date_formate += " #{date.tibetan_start_day}#{intercalary_day_suffix}<sup>#{TimeUnit.suffix_dates(date.tibetan_start_day)}</sup> of the" unless date.tibetan_start_day.blank?
    tibetan_date_formate += " #{date.tibetan_start_month}#{intercalary_month_suffix}<sup>#{TimeUnit.suffix_dates(date.tibetan_start_month)}</sup> month" if date.tibetan_start_month
    tibetan_date_formate += " - " unless date.tibetan_end_day.blank? or date.tibetan_end_month.blank?
    tibetan_date_formate += "#{date.tibetan_end_day}#{intercalary_day_suffix}<sup>#{TimeUnit.suffix_dates(date.tibetan_end_day)}</sup> of the" unless date.tibetan_end_day.blank?
    tibetan_date_formate += " #{date.tibetan_end_month}#{intercalary_month_suffix}<sup>#{TimeUnit.suffix_dates(date.tibetan_end_month)}</sup> month" unless date.tibetan_start_month.blank?
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
    tibetan_date_formate += "#{date.rabjung_start}<sup>#{TimeUnit.suffix_dates(date.rabjung_start)}</sup>" unless date.rabjung_start.blank?
    tibetan_date_formate += "-#{date.rabjung_end}<sup>#{TimeUnit.suffix_dates(date.rabjung_end)}</sup> sixty-cycle" unless date.rabjung_end.blank?
    tibetan_date_formate += "(#{date.rabjung_certainty})" if date.rabjung_certainty == "Probable" or date.rabjung_certainty == "Estimated"
    tibetan_date_formate += " (#{date.calendrical})" unless date.calendrical.blank?
    tibetan_date_formate
  end
  
  def time_unit_field(label, object, object_name, fields, select_options=[], options={})
    
    width = 150
    
    # Two types of field groups are available:
    # 1. If there are 2 fields, the first is the start and the second is certainty
    # 2. If there are 3 fields, they'll be start, end, and certainty, with the certainty field toggling the end field
    start_field = fields[0]
    if fields.length == 2
      certainty_field = fields[1]
    elsif fields.length == 3
      end_field = fields[1]
      certainty_field = fields[2]
    end
    
    #
    start_field_value = object.send("#{start_field}")
    end_field_value = object.send("#{end_field}") if end_field
    
    html = ""
    html += "<p>"
    html += label_tag label + "<br />"
    if options[:text_field]
      html += text_field_tag "#{object_name}[#{start_field}]", start_field_value, { 'style' => "width:#{width}px;" }
      html += text_field_tag "#{object_name}[#{end_field}]", end_field_value, { 'style' => "width:#{width}px; display:none;" } if end_field
    else
      html += select_tag "#{object_name}[#{start_field}]", options_for_select(select_options, start_field_value), { 'style' => "width:#{width}px;" }
      html += select_tag "#{object_name}[#{end_field}]", options_for_select(select_options, end_field_value), { 'style' => "width:#{width}px;display:none;" } if end_field
    end
    html += select_tag "#{object_name}[#{certainty_field}]",
      options_for_select(tu_options('certainty')),
      :onchange => ("toggle_end_date(this, '#{object_name}_#{end_field}')" if end_field)
    html += "</p>"
    html
    
  end
  
  def tu_options(field, include_blank=true)
    options = case field
      when 'am_pm'              then [['AM','am'],['PM','pm']]
      when 'animal'             then [["dragon","dragon"], ["snake","snake"], ["horse","horse"], ["sheep","sheep"], ["monkey","monkey"], ["cock","cock"], ["dog","dog"], ["boar","boar"], ["rat","rat"], ["tiger","tiger"], ["ox","ox"], ["hare","hare"]]
      when 'calendrical'        then [['standard Tibetan calendar','standard Tibetan calendar']]
      when 'certainty'          then [["Certain","Certain"], ["Probable", "Probable"], ["Estimated","Estimated"]]
      when 'day_of_week'        then [["Monday","Monday"], ["Tuesday","Tuesday"], ["Wednesday","Wednesday"], ["Thursday","Thursday"], ["Friday","Friday"], ["Saturday","Saturday"], ["Sunday","Sunday"]]
      when 'element'            then [["earth","earth"], ["iron","iron"], ["water","water"], ["wood","wood"], ["fire","fire"]]
      when 'gender'             then [['Male','male'],['Female','female']]
      when 'gregorian_day'      then (1..31).to_a.map {|x| [x,x]}
      when 'hour'               then (1..12).to_a.map {|x| [x,x]}
      when 'intercalary_day'    then [['secondary','secondary'],['tertiary','tertiary']]
      when 'intercalary_month'  then [['secondary','secondary'],['tertiary','tertiary']]
      when 'minute'             then (1..60).to_a.map {|x| [x,x]}
      when 'month'              then (1..12).to_a.map {|x| [x,x]}
      when 'rabjung'            then (1..50).to_a.map {|x| [x,x]}
      when 'season'             then [["Spring","Spring"],["Summer","Summer"],["Fall","Fall"],["Winter","Winter"]]
      when 'tibetan_day'        then (1..30).to_a.map {|x| [x,x]}
      when 'time_of_day'        then [["nam langs: dawn","nam langs: dawn"],["nyi shar:  sunrise", "nyi shar:  sunrise"],["nyi dros or snga dro: morning","nyi dros or snga dro: morning"],["nyi phyed: noon","nyi phyed: noon"],["phye yod or phyi dro: afternoon","phye yod or phyi dro: afternoon"],["nyi myur: hour before sunset","nyi myur: hour before sunset"],["nyi nub: sunset","nyi nub: sunset"],["sa sros: evening twilight","sa sros: evening twilight"],["srod 'khor:  dusk","srod 'khor:  dusk"],["nam phyed: midnight","nam phyed: midnight"],["phyed yol: after midnight hours","phyed yol: after midnight hours"],["tho rangs: morning twilight","tho rangs: morning twilight"],["nyin mo: day time (general)","nyin mo: day time (general)"],["dgong mo: evening (general)","dgong mo: evening (general)"],["mtshan mo: night time (general)","mtshan mo: night time (general)"]]
      else                      [["",""]]
    end
    options.unshift(['','']) if include_blank
    options
  end

  def format_minute(minute)
    "%02d" % minute
  end
  
end
