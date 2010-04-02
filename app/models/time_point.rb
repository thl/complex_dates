class TimePoint < TimeUnit
  belongs_to :date, :class_name => "ComplexDate"
end