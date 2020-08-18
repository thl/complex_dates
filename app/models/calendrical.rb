class Calendrical
  include KmapsEngine::PassiveRecord
  
  attr_accessor :name
  
  create name: 'Pakluk Kalacakra'
  create name: 'Tsurpu'
  
  def to_s
    name
  end
end