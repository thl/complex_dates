class DayOfWeek < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "Monday", :id => 1
  create :name => "Tuesday", :id => 2
  create :name => "Wednesday", :id => 3
  create :name => "Thursday", :id => 4
  create :name => "Friday", :id => 5
  create :name => "Saturday", :id => 6
  create :name => "Sunday", :id => 7
  
  def to_s
    name
  end
end