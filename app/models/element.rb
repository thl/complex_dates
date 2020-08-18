class Element
  include KmapsEngine::PassiveRecord
  
  attr_accessor :name
  
  create name: 'Earth'
  create name: 'Iron'
  create name: 'Water'
  create name: 'Wood'
  create name: 'Fire'
  
  def to_s
    name
  end
end