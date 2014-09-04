class TimeUnit < ActiveRecord::Base
  include KmapsEngine::IsNotable
  
  belongs_to :dateable, :polymorphic=>true
  # belongs_to :calendar
  belongs_to :date, :class_name => 'ComplexDate'
  belongs_to :start_date, :class_name => 'ComplexDate'
  belongs_to :end_date, :class_name => 'ComplexDate'
  has_many :imports, :as => 'item', :dependent => :destroy
  
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