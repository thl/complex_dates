class DayOfWeek
  include KmapsEngine::PassiveRecord

  attr_accessor :gregorian_name, :tibetan_name
  
  create gregorian_name: 'Sunday', tibetan_name: "gza' nyi ma"
  create gregorian_name: 'Monday', tibetan_name: "gza' zla ba"
  create gregorian_name: 'Tuesday', tibetan_name: "gza' mig dmar"
  create gregorian_name: 'Wednesday', tibetan_name: "gza' lhag pa"
  create gregorian_name: 'Thursday', tibetan_name: "gza' phur bu"
  create gregorian_name: 'Friday', tibetan_name: "gza' pa sangs"
  create gregorian_name: 'Saturday', tibetan_name: "gza' spen pa"
  
  def to_s
    "#{gregorian_name} / #{tibetan_name}"
  end
end