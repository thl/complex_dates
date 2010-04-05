class Animal < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "Hare", :id => 1
  create :name => "Dragon", :id => 2
  create :name => "Snake", :id => 3
  create :name => "Horse", :id => 4
  create :name => "Sheep", :id => 5
  create :name => "Monkey", :id => 6
  create :name => "Cock", :id => 7
  create :name => "Dog", :id => 8
  create :name => "Boar", :id => 9
  create :name => "Rat", :id => 10
  create :name => "Ox", :id => 11
  create :name => "Tiger", :id => 12
  
  def to_s
    name
  end
end