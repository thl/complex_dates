class Calendrical < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "Pakluk Kalacakra", :id => 1
  create :name => "Tsurpu", :id => 2
  
  def to_s
    name
  end
end