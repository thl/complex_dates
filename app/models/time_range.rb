class TimeRange < TimeUnit
  belongs_to :start_date, :class_name => "ComplexDate"
  belongs_to :end_date, :class_name => "ComplexDate"
end