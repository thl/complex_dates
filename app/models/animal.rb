class Animal
  include KmapsEngine::PassiveRecord
  
  attr_accessor :name
  
  create name: 'Hare'
  create name: 'Dragon'
  create name: 'Snake'
  create name: 'Horse'
  create name: 'Sheep'
  create name: 'Monkey'
  create name: 'Cock'
  create name: 'Dog'
  create name: 'Boar'
  create name: 'Rat'
  create name: 'Ox'
  create name: 'Tiger'
  
  def to_s
    name
  end
end