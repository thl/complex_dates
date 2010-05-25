class Frequency < PassiveRecord::Base
  extend IsOptionable
  
  schema :id => Integer, :title => String
  
  def self.populate
    create :id => 1, :title => 'daily', :order => 1
    create :id => 2, :title => 'weekly', :order => 2
    create :id => 3, :title => 'monthly', :order => 3
    create :id => 4, :title => 'annual', :order => 4
  end
  
  self.populate
end