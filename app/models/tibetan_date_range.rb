class TibetanDateRange < TimeRange
  belongs_to :start_date, :class_name => "TibetanDate"
  belongs_to :end_date, :class_name => "TibetanDate"
  
  def is_range
    true
  end
  
  def calendar_id
    2
  end
end

