class ComplexDateRange < ActiveRecord::Base
  has_one :start_date, :class_name => "ComplexDate"
  has_one :end_date, :class_name => "ComplexDate"
end

