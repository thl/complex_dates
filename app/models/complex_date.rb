class ComplexDate < ActiveRecord::Base
  #belongs_to :year_certainty, :class_name => "Certainty"
  #belongs_to :season
  #belongs_to :season_end, :class_name => "Season"
  #belongs_to :season_certainty, :class_name => "Certainty"
  #belongs_to :month_certainty, :class_name => "Certainty"
  #belongs_to :day_certainty, :class_name => "Certainty"
  #belongs_to :day_of_week
  #belongs_to :day_of_week_end, :class_name => "DayOfWeek"
  #belongs_to :day_of_week_certainty, :class_name => "Certainty"
  #belongs_to :time_of_day
  #belongs_to :time_of_day_end, :class_name => "TimeOfDay"
  #belongs_to :time_of_day_certainty, :class_name => "Certainty"
  #belongs_to :hour_certainty, :class_name => "Certainty"
  #belongs_to :minute_certainty, :class_name => "Certainty"
  #belongs_to :animal
  #belongs_to :animal_certainty, :class_name => "Certainty"
  #belongs_to :calendrical
  #belongs_to :calendrical_certainty, :class_name => "Certainty"
  #belongs_to :element
  #belongs_to :element_certainty, :class_name => "Certainty"
  #belongs_to :gender
  #belongs_to :gender_certainty, :class_name => "Certainty"
  #belongs_to :intercalary_month
  #belongs_to :intercalary_month_end, :class_name => "IntercalaryMonth"
  #belongs_to :intercalary_day
  #belongs_to :intercalary_day_end, :class_name => "IntercalaryDay"
  #belongs_to :rabjung
  #belongs_to :rabjung_end, :class_name => "Rabjung"
  #belongs_to :rabjung_certainty, :class_name => "Certainty"
  
  include Comparable
  before_validation :set_certainty_of_blank_fields
  
  after_save do |record|
    time_unit = record.time_unit
    time_unit.touch if !time_unit.nil?
  end
  
  
  def year_certainty
    self.year_certainty_id.nil? ? nil : Certainty.find(self.year_certainty_id)
  end

  def year_certainty=(obj)
    self.year_certainty_id = obj.id
  end
  
  def season
    self.season_id.nil? ? nil : Season.find(self.season_id)
  end

  def season=(obj)
    self.season_id = obj.id
  end
  
  def season_end
    self.season_end_id.nil? ? nil : Season.find(self.season_end_id)
  end

  def season_end=(obj)
    self.season_end_id = obj.id
  end
  
  def season_certainty
    self.season_certainty_id.nil? ? nil : Certainty.find(self.season_certainty_id)
  end
  
  def season_certainty=(obj)
    self.season_certainty_id = obj.id
  end
  
  def month_certainty
    self.month_certainty_id.nil? ? nil : Certainty.find(self.month_certainty_id)
  end

  def month_certainty=(obj)
    self.month_certainty_id = obj.id
  end
  
  def day_certainty
    self.day_certainty_id.nil? ? nil : Certainty.find(self.day_certainty_id)
  end

  def day_certainty=(obj)
    self.day_certainty_id = obj.id
  end
  
  def day_of_week
    self.day_of_week_id.nil? ? nil : DayOfWeek.find(self.day_of_week_id)
  end

  def day_of_week=(obj)
    self.day_of_week_id = obj.id
  end
  
  def day_of_week_end
    self.day_of_week_end_id.nil? ? nil : DayOfWeek.find(self.day_of_week_end_id)
  end

  def day_of_week_end=(obj)
    self.day_of_week_end_id = obj.id
  end
  
  def day_of_week_certainty
    self.day_of_week_certainty_id.nil? ? nil : Certainty.find(self.day_of_week_certainty_id)
  end

  def day_of_week_certainty=(obj)
    self.day_of_week_certainty_id = obj.id
  end

  
  def time_of_day
    self.time_of_day_id.nil? ? nil : TimeOfDay.find(self.time_of_day_id)
  end

  def time_of_day=(obj)
    self.time_of_day_id = obj.id
  end
  
  def time_of_day_end
    self.time_of_day_end_id.nil? ? nil : TimeOfDay.find(self.time_of_day_end_id)
  end

  def time_of_day_end=(obj)
    self.time_of_day_end_id = obj.id
  end
  
  def time_of_day_certainty
    self.time_of_day_certainty_id.nil? ? nil : Certainty.find(self.time_of_day_certainty_id)
  end

  def time_of_day_certainty=(obj)
    self.time_of_day_certainty_id = obj.id
  end
  
  def hour_certainty
    self.hour_certainty_id.nil? ? nil : Certainty.find(self.hour_certainty_id)
  end

  def hour_certainty=(obj)
    self.hour_certainty_id = obj.id
  end
  
  def minute_certainty
    self.minute_certainty_id.nil? ? nil : Certainty.find(self.minute_certainty_id)
  end
  
  def minute_certainty=(obj)
    self.minute_certainty_id = obj.id
  end
  
  def animal
    self.animal_id.nil? ? nil : Animal.find(self.animal_id)
  end

  def animal=(obj)
    self.animal_id = obj.id
  end
  
  def animal_certainty
    self.animal_certainty_id.nil? ? nil : Certainty.find(self.animal_certainty_id)
  end

  def animal_certainty=(obj)
    self.animal_certainty_id = obj.id
  end
  
  def calendrical
    self.calendrical_id.nil? ? nil : Calendrical.find(self.calendrical_id)
  end

  def calendrical=(obj)
    self.calendrical_id = obj.id
  end
  
  def calendrical_certainty
    self.calendrical_certainty_id.nil? ? nil : Certainty.find(self.calendrical_certainty_id)
  end

  def calendrical_certainty=(obj)
    self.calendrical_certainty_id = obj.id
  end
  
  def element
    self.element_id.nil? ? nil : Element.find(self.element_id)
  end

  def element=(obj)
    self.element_id = obj.id
  end
  
  def element_certainty
    self.element_certainty_id.nil? ? nil : Certainty.find(self.element_certainty_id)
  end

  def element_certainty=(obj)
    self.element_certainty_id = obj.id
  end
  
  def gender
    self.gender_id.nil? ? nil : Gender.find(self.gender_id)
  end

  def gender=(obj)
    self.gender_id = obj.id
  end
  
  def gender_certainty
    self.gender_certainty_id.nil? ? nil : Certainty.find(self.gender_certainty_id)
  end

  def gender_certainty=(obj)
    self.gender_certainty_id = obj.id
  end
  
  def intercalary_month
    self.intercalary_month_id.nil? ? nil : IntercalaryMonth.find(self.intercalary_month_id)
  end

  def intercalary_month=(obj)
    self.intercalary_month_id = obj.id
  end
  
  def intercalary_month_end
    self.intercalary_month_end_id.nil? ? nil : IntercalaryMonth.find(self.intercalary_month_end_id)
  end

  def intercalary_month_end=(obj)
    self.intercalary_month_end_id = obj.id
  end
  
  def intercalary_day
    self.intercalary_day_id.nil? ? nil : IntercalaryDay.find(self.intercalary_day_id)
  end

  def intercalary_day=(obj)
    self.intercalary_day_id = obj.id
  end
  
  def intercalary_day_end
    self.intercalary_day_end_id.nil? ? nil : IntercalaryDay.find(self.intercalary_day_end_id)
  end

  def intercalary_day_end=(obj)
    self.intercalary_day_end_id = obj.id
  end
  
  def rabjung
    self.rabjung_id.nil? ? nil : Rabjung.find(self.rabjung_id)
  end
  
  def rabjung=(obj)
    self.rabjung_id = obj.id
  end
  
  def rabjung_end
    self.rabjung_end_id.nil? ? nil : Rabjung.find(self.rabjung_end_id)
  end

  def rabjung_end=(obj)
    self.rabjung_end_id = obj.id
  end
  
  def rabjung_certainty
    self.rabjung_certainty_id.nil? ? nil : Certainty.find(self.rabjung_certainty_id)
  end
  
  def rabjung_certainty=(obj)
    self.rabjung_certainty_id = obj.id
  end
  
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
      d << "#{formatted_gregorian_season}" unless formatted_gregorian_season.blank?
      d << "#{formatted_gregorian_year}" unless formatted_gregorian_year.blank?
      d.join(", ")
    else
      d = []
      d << "#{formatted_time}" unless formatted_time.blank?
      d << "#{formatted_tibetan_time_of_day}" unless formatted_tibetan_time_of_day.blank?
      d << "#{formatted_tibetan_day_of_week}" unless formatted_tibetan_day_of_week.blank?
      d << "#{formatted_tibetan_month_day}" unless formatted_tibetan_month_day.blank?
      d << "#{formatted_tibetan_season}" unless formatted_tibetan_season.blank?
      d << "#{formatted_tibetan_year}" unless formatted_tibetan_year.blank?
      d.join(", ")
    end
  end
  
  # It wasn't clear how to set up this association, so it's done manually:
  def time_unit
    TimeUnit.find_by(["date_id = ? OR start_date_id = ? OR end_date_id = ?", id, id, id])
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
      certainty_str = format_grouped_certainties([:hour, :minute])
      "#{format_time(hour, minute)}-#{format_time(hour_end, minute_end)}#{certainty_str}"
    end
  end
  
  # Given an argument of [:hour, :minute], this will return " (hours probable/minutes estimated)"
  # if hour_certainty is probable and minute_certainty is estimated, or nil if the certainties
  # are all either nil or Certainty.default
  def format_grouped_certainties(certainty_prefixes)
    certainty_default = Certainty.default
    formatted_certainties = certainty_prefixes.collect{|prefix|
      value = self.send("#{prefix}_certainty")
      "#{prefix.to_s.pluralize} #{value.to_s.downcase}" unless value.nil?
    }.reject{|v| v.nil? || v == certainty_default}
    " (#{formatted_certainties.join("/")})" unless formatted_certainties.empty?
  end
  
  def formatted_tibetan_time_of_day
    "#{ff(:time_of_day, :format_tibetan_time_of_day)}"
  end
  
  def formatted_gregorian_time_of_day
    "#{ff(:time_of_day, :format_gregorian_time_of_day)}"
  end
  
  def formatted_tibetan_day_of_week
    "#{ff(:day_of_week, :format_tibetan_day_of_week)}"
  end
  
  def formatted_gregorian_day_of_week
    "#{ff(:day_of_week, :format_gregorian_day_of_week)}"
  end
  
  def formatted_tibetan_season
    "#{ff(:season, :format_tibetan_season)}"
  end
  
  def formatted_gregorian_season
    "#{ff(:season, :format_gregorian_season)}"
  end
          
  def formatted_gregorian_month_day
    d = " #{ff(:day, true)}" unless day.nil?
    dw = " (#{ff(:day_of_week, :format_gregorian_day_of_week)})" unless day_of_week.nil?
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
  
  # Methods beginning with "format_" take an argument of a field value and return the formatted version of that value.
  # These take an argument so that they can be also be used for "_end" fields.
  
  def format_minute(minute)
    "%02d" % minute
  end
  
  def format_hour(hour)
    hour == 0 ? 12 : hour % 12
  end
  
  def format_time(hour, minute)
    unless hour.nil?
      am_pm = " #{hour > 11 ? 'PM' : 'AM'}"
      hour = format_hour(hour)
    end
    "#{hour}:#{format_minute(minute)}#{am_pm}" unless hour.nil? && minute.nil?
  end
  
  def format_gregorian_time_of_day(time_of_day)
    time_of_day.gregorian_name unless time_of_day.nil?
  end
    
  def format_tibetan_time_of_day(time_of_day)
    time_of_day.tibetan_name unless time_of_day.nil?
  end
  
  def format_gregorian_day_of_week(day_of_week)
    day_of_week.gregorian_name unless day_of_week.nil?
  end
    
  def format_tibetan_day_of_week(day_of_week)
    day_of_week.tibetan_name unless day_of_week.nil?
  end
  
  def format_gregorian_month(mon)
    month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_names[mon-1] unless mon.nil?
  end
  
  def format_tibetan_month(mon)
    "#{mon.ordinalize}" unless mon.nil?
  end
  
  def format_gregorian_season(season)
    season.gregorian_name unless season.nil?
  end
    
  def format_tibetan_season(season)
    season.tibetan_name unless season.nil?
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
  
  def <=>(obj)
    if obj.class.superclass == Integer
      return self.year <=> obj
    elsif obj.instance_of? String
      self <=> Importation.to_date(obj)
    else
      obj.instance_of? ComplexDate
      comp = self.year <=> obj.year
      return comp if comp!=0
      comp = self.month <=> obj.month
      return comp if comp!=0
      comp = self.day <=> obj.day
      return comp if comp!=0
      comp = self.hour <=> obj.hour
      return comp if comp!=0
      comp = self.minute <=> obj.minute
      return comp if comp!=0
    end
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