class DayOfWeek < PassiveRecord::Base
  extend IsOptionable
  
  schema :id => Integer, :gregorian_name => String, :tibetan_name => String
  
  create :id => 1, :gregorian_name => "Sunday", :tibetan_name => "gza' nyi ma"
  create :id => 2, :gregorian_name => "Monday", :tibetan_name => "gza' zla ba"
  create :id => 3, :gregorian_name => "Tuesday", :tibetan_name => "gza' mig dmar"
  create :id => 4, :gregorian_name => "Wednesday", :tibetan_name => "gza' lhag pa"
  create :id => 5, :gregorian_name => "Thursday", :tibetan_name => "gza' phur bu"
  create :id => 6, :gregorian_name => "Friday", :tibetan_name => "gza' pa sangs"
  create :id => 7, :gregorian_name => "Saturday", :tibetan_name => "gza' spen pa"
  
  def to_s
    "#{gregorian_name} / #{tibetan_name}"
  end
end