class GregorianDateRange < TimeRange
  belongs_to :start_date, :class_name => "GregorianDate"
  belongs_to :end_date, :class_name => "GregorianDate"
  
  def is_range
    true
  end
  
  def calendar_id
    1
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