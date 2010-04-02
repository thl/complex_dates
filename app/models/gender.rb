class Gender < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "Female", :id => 1
  create :name => "Male", :id => 2
  
  def to_s
    name
  end
end