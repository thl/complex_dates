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

