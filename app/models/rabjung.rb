# Rabjung was made into a model in anticipation of a possible need to
# append explanatory year ranges to the values (e.g. "1 (1027-1087 C.E.)")
class Rabjung
  include KmapsEngine::PassiveRecord
  
  attr_accessor :name
  
  create name: '1'
  create name: '2'
  create name: '3'
  create name: '4'
  create name: '5'
  create name: '6'
  create name: '7'
  create name: '8'
  create name: '9'
  create name: '10'
  create name: '11'
  create name: '12'
  
  def to_s
    name
  end
end