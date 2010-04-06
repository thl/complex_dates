class Certainty < PassiveRecord::Base
  extend IsOptionable

  schema :name => String, :id => Integer
  
  create :name => "Certain", :id => 1
  create :name => "Probable", :id => 2
  create :name => "Estimated", :id => 3
  
  def to_s
    name
  end
  
  def self.default
    self.find(1)
  end
end

