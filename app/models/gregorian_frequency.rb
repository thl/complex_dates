class GregorianFrequency < Frequency
  self.populate
  create title: 'every decade', order: 5
  create title: 'every century', order: 6
end
