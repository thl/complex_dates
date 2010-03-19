# == Schema Information
# Schema version: 20090611015507
#
# Table name: tibetan_dates
#
#  id                  :integer(4)      not null, primary key
#  calendrical         :string(255)
#  rabjung             :integer(4)
#  element             :string(255)
#  animal              :string(255)
#  gender              :string(255)
#  tibetan_month       :integer(4)
#  intercalary_month   :string(255)
#  tibetan_day         :string(255)
#  intercalary_day     :string(255)
#  tibetan_hour        :integer(4)
#  tibetan_minute      :integer(4)
#  tibetan_time_of_day :integer(4)
#  time_unit_id        :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#

class TibetanDate < ActiveRecord::Base
  belongs_to :time_unit, :class_name => "TimeUnit", :foreign_key => "time_unit_id"
end
