class Season
  include KmapsEngine::PassiveRecord
  
  attr_accessor :gregorian_name, :tibetan_name
  
  create gregorian_name: 'Spring', tibetan_name: 'dpyid ka'
  create gregorian_name: 'Summer', tibetan_name: 'dbyar ka'
  create gregorian_name: 'Fall', tibetan_name: 'ston ka'
  create gregorian_name: 'Winter', tibetan_name: 'dgun ka'
  
  def to_s
    "#{gregorian_name} / #{tibetan_name}"
  end
end