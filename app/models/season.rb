class Season < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "Spring", :id => 1
  create :name => "Summer", :id => 2
  create :name => "Fall", :id => 3
  create :name => "Winter", :id => 4
  
  def to_s
    name
  end
end