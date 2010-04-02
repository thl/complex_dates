# Rabjung was made into a model in anticipation of a possible need to
# append explanatory year ranges to the values (e.g. "1 (1027-1087 C.E.)")
class Rabjung < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "1", :id => 1
  create :name => "2", :id => 2
  create :name => "3", :id => 3
  create :name => "4", :id => 4
  create :name => "5", :id => 5
  create :name => "6", :id => 6
  create :name => "7", :id => 7
  create :name => "8", :id => 8
  create :name => "9", :id => 9
  create :name => "10", :id => 10
  create :name => "11", :id => 11
  create :name => "12", :id => 12
  
  def to_s
    name
  end
end