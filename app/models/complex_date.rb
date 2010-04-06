# == Schema Information
#
# Table name: complex_dates
#
#  id                             :integer         not null, primary key
#  year                           :integer
#  year_certainty_id              :integer
#  season_id                      :integer
#  season_certainty_id            :integer
#  month                          :integer
#  month_certainty_id             :integer
#  day                            :integer
#  day_certainty_id               :integer
#  day_of_week_id                 :integer
#  day_of_week_certainty_id       :integer
#  time_of_day_id                 :integer
#  time_of_day_certainty_id       :integer
#  hour                           :integer
#  hour_certainty_id              :integer
#  minute                         :integer
#  minute_certainty_id            :integer
#  animal_id                      :integer
#  animal_certainty_id            :integer
#  calendrical_id                 :integer
#  calendrical_certainty_id       :integer
#  element_certainty_id           :integer
#  element_id                     :integer
#  gender_id                      :integer
#  gender_certainty_id            :integer
#  intercalary_month_id           :integer
#  intercalary_day_id             :integer
#  rabjung_id                     :integer
#  rabjung_certainty_id           :integer
#  created_at                     :timestamp
#  updated_at                     :timestamp
#  year_end                       :integer
#  season_end_id                  :integer
#  month_end                      :integer
#  day_end                        :integer
#  day_of_week_end_id             :integer
#  time_of_day_end_id             :integer
#  hour_end                       :integer
#  minute_end                     :integer
#  rabjung_end_id                 :integer
#  intercalary_month_end_id       :integer
#  intercalary_day_end_id         :integer
#

class ComplexDate < ActiveRecord::Base
  #belongs_to :time_unit
  belongs_to :year_certainty, :class_name => "Certainty"
  belongs_to :season
  belongs_to :season_end, :class_name => "Season"
  belongs_to :season_certainty, :class_name => "Certainty"
  belongs_to :month_certainty, :class_name => "Certainty"
  belongs_to :day_certainty, :class_name => "Certainty"
  belongs_to :day_of_week
  belongs_to :day_of_week_end, :class_name => "DayOfWeek"
  belongs_to :day_of_week_certainty, :class_name => "Certainty"
  belongs_to :time_of_day
  belongs_to :time_of_day_end, :class_name => "TimeOfDay"
  belongs_to :time_of_day_certainty, :class_name => "Certainty"
  belongs_to :hour_certainty, :class_name => "Certainty"
  belongs_to :minute_certainty, :class_name => "Certainty"
  belongs_to :animal
  belongs_to :animal_certainty, :class_name => "Certainty"
  belongs_to :calendrical
  belongs_to :calendrical_certainty, :class_name => "Certainty"
  belongs_to :element
  belongs_to :element_certainty, :class_name => "Certainty"
  belongs_to :gender
  belongs_to :gender_certainty, :class_name => "Certainty"
  belongs_to :intercalary_month
  belongs_to :intercalary_month_end, :class_name => "IntercalaryMonth"
  belongs_to :intercalary_day
  belongs_to :intercalary_day_end, :class_name => "IntercalaryDay"
  belongs_to :rabjung
  belongs_to :rabjung_end, :class_name => "Rabjung"
  belongs_to :rabjung_certainty, :class_name => "Certainty"
  
  before_validation :set_certainty_of_blank_fields
  
  def after_initialize
    set_default_values
  end
  
  # Currently the only default values are the certainty values, which should be set to Certain.
  def set_default_values
    certainty_default = Certainty.default
    certainty_fields.each do |field_name|
      self.send("#{field_name}=", certainty_default) if self.send("#{field_name}").nil?
    end
  end
  
  # If a field is blank, its certainty shouldn't be Probable or Estimated, so set it to the
  # default certainty value, Certain.
  def set_certainty_of_blank_fields
    certainty_default = Certainty.default
    certainty_fields.each do |certainty_field_name|
      field_name = certainty_field_name.sub(/_certainty$/, "")
      self.send("#{certainty_field_name}=", certainty_default) if self.send(field_name).blank?
    end
  end
  
  def certainty_fields
    certainty_prefixes = %w[year season month day day_of_week time_of_day hour minute animal calendrical element gender rabjung]
    certainty_prefixes.collect{|prefix| "#{prefix}_certainty"}
  end

  def to_s
    if time_unit.calendar_id == 1
      d = []
      d << "#{formatted_time}" unless formatted_time.blank?
      d << "#{formatted_gregorian_time_of_day}" unless formatted_gregorian_time_of_day.blank?
      d << "#{formatted_gregorian_month_day}" unless formatted_gregorian_month_day.blank?
      d << "#{formatted_season}" unless formatted_season.blank?
      d << "#{formatted_gregorian_year}" unless formatted_gregorian_year.blank?
      d.join(", ")
    else
      d = []
      d << "#{formatted_time}" unless formatted_time.blank?
      d << "#{formatted_tibetan_time_of_day}" unless formatted_tibetan_time_of_day.blank?
      d << "#{formatted_tibetan_month_day}" unless formatted_tibetan_month_day.blank?
      d << "#{formatted_tibetan_year}" unless formatted_tibetan_year.blank?
      d.join(", ")
    end
  end
  
  # It wasn't clear how to set up this association, so it's done manually:
  def time_unit
    TimeUnit.find(:first, :conditions => ["date_id = ? OR start_date_id = ? OR end_date_id = ?", id, id, id])
  end
  
  # Methods beginning with "formatted_" return the formatted version of groups of fields that are separated by
  # commas in to_s.
  
  def formatted_time
    # If an end time isn't set:
    if hour_end.nil? && minute_end.nil?
      unless hour.nil?
        am_pm = " #{hour > 11 ? 'PM' : 'AM'}"
      end
      "#{ff(:hour, true)}:#{ff(:minute, true)}#{am_pm}" unless hour.nil? && minute.nil?
    # If at least one of the _end fields isn't nil:
    else
      certainty_default = Certainty.default
      certainty_values = [hour_certainty, minute_certainty].reject{|c| c.nil? || c == certainty_default}
      certainty = " (#{certainty_values.collect{|c| c.to_s}.join("/")})" unless certainty_values.empty?
      "#{format_time(hour, minute)}-#{format_time(hour_end, minute_end)}#{certainty}"
    end
  end
  
  def formatted_tibetan_time_of_day
    "#{ff(:time_of_day, :format_tibetan_time_of_day)}"
  end
  
  def formatted_gregorian_time_of_day
    "#{ff(:time_of_day, :format_gregorian_time_of_day)}"
  end
      
  def formatted_gregorian_month_day
    d = " #{ff(:day, true)}" unless day.nil?
    dw = " (#{ff(:day_of_week)})" unless day_of_week.nil?
    "#{ff(:month, :format_gregorian_month)}#{d}#{dw}" unless month.nil? && day.nil? && day_of_week.nil?
  end
  
  def formatted_tibetan_month_day
    d = "#{ff(:day, true, :intercalary => true)} day of the " unless day.nil?
    m = "#{ff(:month, :format_tibetan_month, :intercalary => true)} month" unless month.nil?
    "#{d}#{m}" unless month.nil? && day.nil?
  end
    
  def formatted_gregorian_year
    "#{ff(:year)}"
  end
  
  def formatted_tibetan_year
    hyphen = "-" unless element.nil? || animal.nil?
    r = ff(:rabjung, true)
    r = " of the #{r} sixty-year cycle" unless r.blank?
    suffix = " (standard Tibetan calendar)"
    "the #{ff(:gender, true)} #{ff(:element, true)}#{hyphen}#{ff(:animal, true)} year#{r}#{suffix}" unless gender.nil? && element.nil? && animal.nil? && r.blank?
  end
  
  def formatted_season
    "#{ff(:season)}"
  end
  
  # Methods beginning with "format_" take an argument of a field value and return the formatted version of that value.
  # These take an argument so that they can be also be used for "_end" fields.
  
  def format_minute(minute)
    "%02d" % minute
  end
  
  def format_hour(hour)
    hour == 0 ? 12 : hour % 12
  end
  
  def format_time(hour, minute)
    am_pm = " #{hour > 11 ? 'PM' : 'AM'}"
    hour = format_hour(hour)
    "#{hour}:#{format_minute(minute)}#{am_pm}" unless hour.nil? && minute.nil?
  end
  
  def format_gregorian_time_of_day(time_of_day)
    time_of_day.gregorian_name unless time_of_day.nil?
  end
    
  def format_tibetan_time_of_day(time_of_day)
    time_of_day.tibetan_name unless time_of_day.nil?
  end
  
  def format_gregorian_month(mon)
    month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_names[mon-1] || nil
  end
  
  def format_tibetan_month(mon)
    "#{mon.ordinalize}" unless mon.nil?
  end
  
  def format_day(day)
    day.ordinalize unless day.nil?
  end
  
  def format_rabjung(rab)
    Integer(rab.to_s).ordinalize unless rab.nil?
  end
  
  def format_animal(ani)
    ani.to_s.downcase
  end
  
  def format_element(ele)
    ele.to_s.downcase
  end
  
  def format_gender(gen)
    gen.to_s.downcase
  end
  
  def format_intercalary(ic)
    case ic
      when 1 then "a"
      when 2 then "b"
      else ""
    end
  end
  
  # This returns the start, end (if it exists), and certainty (if it exists and isn't "Certain") values, formatted
  # for display.  It's short-hand for "formatted field". 
  def ff(field_name, format_method=nil, options={})
    end_field_name = "#{field_name}_end".to_sym
    certainty_field_name = "#{field_name}_certainty".to_sym
    format_method = "format_#{field_name}".to_sym if format_method == true
    
    start_value = self.send(field_name)
    end_value = self.send(end_field_name) if self.respond_to?(end_field_name)
    certainty_value = self.send(certainty_field_name) if self.respond_to?(certainty_field_name)
    
    unless format_method.nil?
      start_value = self.send(format_method, start_value)
      end_value = self.send(format_method, end_value) unless end_value.nil?
    end
    
    unless options[:intercalary].nil?
      intercalary_field_name = "intercalary_#{field_name}_id".to_sym
      intercalary_end_field_name = "intercalary_#{end_field_name}_id".to_sym
      intercalary_value = self.send(intercalary_field_name)
      intercalary_value = self.send(:format_intercalary, intercalary_value) unless intercalary_value.nil?
      intercalary_end_value = self.send(intercalary_end_field_name)
      intercalary_end_value = self.send(:format_intercalary, intercalary_end_value) unless intercalary_end_value.nil?
      start_value = "#{start_value} (#{intercalary_value})" unless intercalary_value.nil? || start_value.nil?
      end_value = "#{end_value} (#{intercalary_end_value})" unless intercalary_end_value.nil? || end_value.nil?
    end
        
    f = ""
    f += start_value.to_s
    f += "-#{end_value}" unless end_value.nil?
    f += " (#{certainty_value.to_s.downcase})" unless (certainty_value.blank? || certainty_value.to_s.eql?("Certain"))
    f
  end
end