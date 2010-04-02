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
  unloadable
  
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
  
  def self.search(filter_value, options={})
    options[:conditions] = {}
    #build_like_conditions(
    #  %W(notes.content notes.custom_note_title note_titles.title),
    #  filter_value
    #)
    paginate(options)
  end
end

