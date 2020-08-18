class IntercalaryDay
  include KmapsEngine::PassiveRecord
  
  attr_accessor :name
  
  create name: 'Secondary'
  create name: 'Tertiary'
  
  def to_s
    name
  end
end