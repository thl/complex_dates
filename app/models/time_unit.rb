class TimeUnit < ActiveRecord::Base
  include KmapsEngine::IsNotable
  
  belongs_to :dateable, polymorphic: true, touch: true
  # belongs_to :calendar
  belongs_to :date, class_name: 'ComplexDate', optional: true, dependent: :destroy
  belongs_to :start_date, class_name: 'ComplexDate', optional: true, dependent: :destroy
  belongs_to :end_date, class_name: 'ComplexDate', optional: true, dependent: :destroy
  accepts_nested_attributes_for :date, :start_date, :end_date
  
  has_many :imports, as: 'item', dependent: :destroy
  
  def to_s
    s = is_range ? "#{start_date} - #{end_date}" : date.to_s
    freq = self.frequency
    s << " (#{freq.title})" if !freq.nil?
    s
  end
  
  def date_model
    types = [self.calendar_id, self.is_range]
    model_name = case types
      when [1, false] then 'GregorianDate'
      when [1, true] then 'GregorianDateRange'
      when [2, false] then 'TibetanDate'
      when [2, true] then 'TibetanDateRange'
      else nil
    end
    model_name
  end
  
  def frequency
    return nil if self.frequency_id.nil?
    return case self.calendar_id
    when 1 then GregorianFrequency.find(self.frequency_id)
    when 2 then TibetanFrequency.find(self.frequency_id)
    else Frequency.find(self.frequency_id)
    end
  end
  
  def range_equal?(range)
    return nil if !self.is_range?
    self.start_date==range[0] && self.end_date==range[1]
  end
  
  def between?(obj, obj2)
    return false if self.calendar_id != 1 # Only gregorian calendars supported
    if obj.nil?
      if obj2.nil?
        return false
      else
        if self.is_range?
          if self.start_date.nil?
            if self.end_date.nil?
              return false
            else
              # return true for mathematical comparisons, but here being more practical
              self.end_date<=obj2
            end
          else
            self.start_date<=obj2
          end
        else
          self.date<=obj2
        end
      end
    else
      if obj2.nil?
        if self.is_range?
          if self.start_date.nil?
            if self.end_date.nil?
              return false
            else
              self.end_date>=obj
            end
          else
            if self.end_date.nil?
              # return true
              self.start_date>=obj
            else
              self.end_date>=obj
            end
          end
        else
          self.date>=obj
        end
      else
        if self.is_range?
          if self.start_date.nil?
            if self.end_date.nil?
              return false
            else
              #self.end_date>=obj
              self.end_date.between?(obj, obj2)
            end
          else
            if self.end_date.nil?
              # self.start_date<=obj2
              self.start_date.between?(obj, obj2)
            else
              self.start_date.between?(obj, obj2) || self.end_date.between?(obj, obj2)
            end
          end
        else
          self.date.between?(obj, obj2)
        end
      end
    end
  end
  
  def feature
    self.dateable.feature
  end
end

# == Schema Info
# Schema version: 20100525173430
#
# Table name: time_units
#
#  id            :integer         not null, primary key
#  calendar_id   :integer
#  date_id       :integer
#  dateable_id   :integer
#  end_date_id   :integer
#  frequency_id  :integer
#  start_date_id :integer
#  dateable_type :string(255)
#  is_range      :boolean
#  created_at    :timestamp
#  updated_at    :timestamp
