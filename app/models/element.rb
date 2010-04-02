class Element < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "Earth", :id => 1
  create :name => "Iron", :id => 2
  create :name => "Water", :id => 3
  create :name => "Wood", :id => 4
  create :name => "Fire", :id => 5
  
  def to_s
    name
  end
end