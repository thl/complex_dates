#
# This module can be extended by any model that should have its <select/> options sorted.  
# The sorting is done by either .order, .id, or not at all, depending on whether the model
# has these attributes.
#
# The sorting is done by .sort because PassiveRecord currently doesn't support ordering by
# :conditions.
#
module IsOptionable
  
  def self.extended(base)
    
    def options
      if(self.find(:all).first.respond_to?(:order))
        self.find(:all).sort{|a,b| a.order <=> b.order}
      elsif(self.find(:all).first.respond_to?(:id))
        self.find(:all).sort{|a,b| a.id <=> b.id}
      else
        self.find(:all)
      end
    end
    
  end
  
end