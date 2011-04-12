class Season < PassiveRecord::Base
  extend IsOptionable
  
  schema :id => Integer, :gregorian_name => String, :tibetan_name => String
  
  create :id => 1, :gregorian_name => "Spring", :tibetan_name => "dpyid ka"
  create :id => 2, :gregorian_name => "Summer", :tibetan_name => "dbyar ka"
  create :id => 3, :gregorian_name => "Fall", :tibetan_name => "ston ka"
  create :id => 4, :gregorian_name => "Winter", :tibetan_name => "dgun ka"
  
  def to_s
    "#{gregorian_name} / #{tibetan_name}"
  end
end