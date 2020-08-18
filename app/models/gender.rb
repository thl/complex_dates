class Gender
  include KmapsEngine::PassiveRecord
  
  attr_accessor :name
  
  create name: 'Female'
  create name: 'Male'
  
  def to_s
    name
  end
end