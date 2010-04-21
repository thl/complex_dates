# == Schema Information
#
# Table name: time_units
#
#  id            :integer         not null, primary key
#  date_id       :integer
#  start_date_id :integer
#  end_date_id   :integer
#  calendar_id   :integer
#  is_range      :boolean
#  dateable_id   :integer
#  dateable_type :string(255)
#  created_at    :timestamp
#  updated_at    :timestamp
#

class TimeUnit < ActiveRecord::Base
  extend IsNotable
  
  belongs_to :dateable, :polymorphic=>true
  belongs_to :calendar
  belongs_to :date, :class_name => "ComplexDate"
  belongs_to :start_date, :class_name => "ComplexDate"
  belongs_to :end_date, :class_name => "ComplexDate"
  
  accepts_nested_attributes_for :date
  accepts_nested_attributes_for :end_date
  accepts_nested_attributes_for :start_date

  def to_s
   if is_range
     "#{start_date} - #{end_date}"
   else
     date.to_s
   end
  end
  
  def date_model
    types = [self.calendar_id, self.is_range]
    model_name = case types
      when [1, false] then "GregorianDate"
      when [1, true] then "GregorianDateRange"
      when [2, false] then "TibetanDate"
      when [2, true] then "TibetanDateRange"
      else nil
    end
    model_name
  end
  
  # This is currently fairly rudimentary, as it isn't being put to important use yet.
  # Currently, it sorts all Gregorian dates before all Tibetan dates, then sorts by the
  # fields listed below of either date or end_date, depending on whether the TimeUnit
  # is a point or range. 
  def self.find_ordered_by_date(conditions=nil)
    order = 'time_units.calendar_id ASC, '
    complex_date_fields = %w[rabjung_id year season_id month day hour minute]
    order += complex_date_fields.collect{|field| "complex_dates.#{field} DESC"}.join(", ")
    self.find(:all, :conditions => conditions, :order => order, :include=>[:date, :end_date])
  end
    
  def self.search(filter_value, options={})
    options[:conditions] = {}
    #build_like_conditions(
    #  %W(notes.content notes.custom_note_title note_titles.title),
    #  filter_value
    #)
    paginate(options)
  end
  
  def search(filter_value, options={})
    options[:conditions] = {}
    #build_like_conditions(
    #  %W(notes.content notes.custom_note_title note_titles.title),
    #  filter_value
    #)
    paginate(options)
  end
end