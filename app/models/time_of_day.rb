class TimeOfDay < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "nam langs: dawn", :id => 1
  create :name => "nyi shar:  sunrise", :id => 2
  create :name => "nyi dros or snga dro: morning", :id => 3
  create :name => "nyi phyed: noon", :id => 4
  create :name => "phye yod or phyi dro: afternoon", :id => 5
  create :name => "nyi myur: hour before sunset", :id => 6
  create :name => "nyi nub: sunset", :id => 7
  create :name => "sa sros: evening twilight", :id => 8
  create :name => "srod 'khor:  dusk", :id => 9
  create :name => "nam phyed: midnight", :id => 10
  create :name => "phyed yol: after midnight hours", :id => 11
  create :name => "tho rangs: morning twilight", :id => 12
  create :name => "nyin mo: day time (general)", :id => 13
  
  def to_s
    name
  end
end