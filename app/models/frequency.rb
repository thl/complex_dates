class Frequency
  include KmapsEngine::PassiveRecord
  
  attr_accessor :title, :order
  
  protected
  
  def self.populate
    create title: 'daily', order: 1
    create title: 'weekly', order: 2
    create title: 'monthly', order: 3
    create title: 'annual', order: 4
  end
  
  self.populate
end