class Calendar < PassiveRecord::Base
  schema :name => String, :id => Integer
  
  create :name => "Gregorian", :id => 1
  create :name => "Tibetan", :id => 2
  
  def to_s
    name
  end
end

