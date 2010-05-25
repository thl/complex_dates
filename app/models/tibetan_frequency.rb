class TibetanFrequency < Frequency
  self.populate
  create :id => 5, :title => 'every 12 year', :order => 5
  create :id => 6, :title => 'every 60 years', :order => 6
end
