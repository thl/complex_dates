class Calendrical < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "To be determined...", :id => 1
  
  def to_s
    name
  end
end