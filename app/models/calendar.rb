class Calendar
  include KmapsEngine::PassiveRecord
  
  attr_accessor :name
  
  create name: 'Gregorian'
  create name: 'Tibetan'
  
  def to_s
    name
  end
end

