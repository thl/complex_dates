class GregorianFrequency < Frequency
  self.populate
  create :id => 5, :title => 'every decade', :order => 5
  create :id => 6, :title => 'every century', :order => 6
end
