class Animal < PassiveRecord::Base
  extend IsOptionable
  
  schema :name => String, :id => Integer
  
  create :name => "Dragon", :id => 1
  create :name => "Snake", :id => 2
  create :name => "Horse", :id => 3
  create :name => "Sheep", :id => 4
  create :name => "Monkey", :id => 5
  create :name => "Cock", :id => 6
  create :name => "Dog", :id => 7
  create :name => "Boar", :id => 8
  create :name => "Rat", :id => 9
  create :name => "Tiger", :id => 10
  create :name => "Ox", :id => 11
  create :name => "Hare", :id => 12
  
  def to_s
    name
  end
end