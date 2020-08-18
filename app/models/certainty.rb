class Certainty
  include KmapsEngine::PassiveRecord
  
  attr_accessor :name
  
  create name: 'Certain'
  create name: 'Probable'
  create name: 'Estimated'
  
  def to_s
    name
  end
  
  def self.default
    self.find(1)
  end
end

