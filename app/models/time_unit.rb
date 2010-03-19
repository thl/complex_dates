# == Schema Information
# Schema version: 20090611015507
#
# Table name: time_units
#
#  id          :integer(4)      not null, primary key
#  project_id  :integer(4)
#  point_range :string(255)
#  date_type   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class TimeUnit < ActiveRecord::Base
  has_one :tibetan_date
  has_one :gregorian_date
  
  has_many :tibetan_range_dates
  has_many :gregorian_range_dates
  
  
  def get_point_date
    self.date_type == "Gregorian" ? self.gregorian_date : self.tibetan_date
  end
  
  def get_range_dates
    dates = self.date_type == "Gregorian" ? self.gregorian_range_dates : self.tibetan_range_dates
    start_date = dates.select { |d|  d if d.start_range }.first
    end_date = dates.select { |d| d if !d.start_range }.first
    [start_date,end_date]
  end
  
  def self.sufix_dates(date)
      date = date.to_i % 10
       if date == 1
          'st'
        elsif date == 2
          'nd'
        elsif date == 3
          'rd'
       else
          'th'
       end
  end
  
  def self.month_string(month)
    months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
     (month.to_i > 0 and month.to_i < 13) ? months[month.to_i - 1] : nil
  end
  
end



