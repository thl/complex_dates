class GregorianDate < ActiveRecord::Base
  belongs_to :time_unit, :class_name => "TimeUnit", :foreign_key => "time_unit_id"
end
