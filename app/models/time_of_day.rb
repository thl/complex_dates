class TimeOfDay < PassiveRecord::Base
  extend IsOptionable
  
  schema :id => Integer, :tibetan_name => String, :gregorian_name => String
  
  create :id => 1, :tibetan_name => "nam langs", :gregorian_name => "dawn"
  create :id => 2, :tibetan_name => "nyi shar", :gregorian_name => " sunrise"
  create :id => 3, :tibetan_name => "nyi dros or snga dro", :gregorian_name => "morning"
  create :id => 4, :tibetan_name => "nyi phyed", :gregorian_name => "noon"
  create :id => 5, :tibetan_name => "phye yod or phyi dro", :gregorian_name => "afternoon"
  create :id => 6, :tibetan_name => "nyi myur", :gregorian_name => "hour before sunset"
  create :id => 7, :tibetan_name => "nyi nub", :gregorian_name => "sunset"
  create :id => 8, :tibetan_name => "sa sros", :gregorian_name => "evening twilight"
  create :id => 9, :tibetan_name => "srod 'khor", :gregorian_name => "dusk"
  create :id => 10, :tibetan_name => "nam phyed", :gregorian_name => "midnight"
  create :id => 11, :tibetan_name => "phyed yol", :gregorian_name => "after midnight hours"
  create :id => 12, :tibetan_name => "tho rangs", :gregorian_name => "morning twilight"
  create :id => 13, :tibetan_name => "nyin mo", :gregorian_name => "day time (general)"
  create :id => 14, :tibetan_name => "dgong mo", :gregorian_name => "evening (general)"  
  create :id => 15, :tibetan_name => "mtshan mo", :gregorian_name => "night time (general)"

  def to_s
    "#{gregorian_name} / #{tibetan_name}"
  end
end