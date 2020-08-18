class TibetanFrequency < Frequency
  self.populate
  create title: 'every 12 year', order: 5
  create title: 'every 60 years', order: 6
end
