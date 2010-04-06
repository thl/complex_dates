class TimeOfDay < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer, :tibetan_name => String, :gregorian_name => String
  
  create :name => "nam langs: dawn", :id => 1,
    :tibetan_name => "nam langs", :gregorian_name => "dawn"
  create :name => "nyi shar:  sunrise", :id => 2,
    :tibetan_name => "nyi shar", :gregorian_name => " sunrise"
  create :name => "nyi dros or snga dro: morning", :id => 3,
    :tibetan_name => "nyi dros or snga dro", :gregorian_name => "morning"
  create :name => "nyi phyed: noon", :id => 4,
    :tibetan_name => "nyi phyed", :gregorian_name => "noon"
  create :name => "phye yod or phyi dro: afternoon", :id => 5,
    :tibetan_name => "phye yod or phyi dro", :gregorian_name => "afternoon"
  create :name => "nyi myur: hour before sunset", :id => 6,
    :tibetan_name => "nyi myur", :gregorian_name => "hour before sunset"
  create :name => "nyi nub: sunset", :id => 7,
    :tibetan_name => "nyi nub", :gregorian_name => "sunset"
  create :name => "sa sros: evening twilight", :id => 8,
    :tibetan_name => "sa sros", :gregorian_name => "evening twilight"
  create :name => "srod 'khor: dusk", :id => 9,
    :tibetan_name => "srod 'khor", :gregorian_name => "dusk"
  create :name => "nam phyed: midnight", :id => 10,
    :tibetan_name => "nam phyed", :gregorian_name => "midnight"
  create :name => "phyed yol: after midnight hours", :id => 11,
    :tibetan_name => "phyed yol", :gregorian_name => "after midnight hours"
  create :name => "tho rangs: morning twilight", :id => 12,
    :tibetan_name => "tho rangs", :gregorian_name => "morning twilight"
  create :name => "nyin mo: day time (general)", :id => 13,
    :tibetan_name => "nyin mo", :gregorian_name => "day time (general)"
  create :name => "dgong mo: evening (general)", :id => 14,
    :tibetan_name => "dgong mo", :gregorian_name => "evening (general)"  
  create :name => "mtshan mo: night time (general)", :id => 15,
    :tibetan_name => "mtshan mo", :gregorian_name => "night time (general)"

  def to_s
    name
  end
end