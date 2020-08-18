class AmPm
  include KmapsEngine::PassiveRecord
  
  attr_accessor :name
  
  create name: 'AM'
  create name: 'PM'
  
  def to_s
    name
  end
end

