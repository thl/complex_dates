class AmPm < PassiveRecord::Base
  extend IsOptionable

  schema :name => String, :id => Integer
  
  create :name => "AM", :id => 1
  create :name => "PM", :id => 2
  
  def to_s
    name
  end
end

