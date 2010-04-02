class IntercalaryDay < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "Secondary", :id => 1
  create :name => "Tertiary", :id => 2
  
  def to_s
    name
  end
end