#
# This module can be extended by any ActiveRecord
# class that needs dates
#
module IsDateable

  
  def self.extended(base)
    
    base.has_many :time_units, :as => :dateable, :dependent => :destroy
    
    base.class_eval do
      
      #
      # methods here...
      #
      def time_units_attributes=(attrs=[])
        attrs.each do |i|
          self.time_unit_attributes=(i.last)
        end
      end
      
      #
      #
      #
      def time_unit_attributes=(attrs={})
        begin
          o = time_units.find(attrs[:id])
          if attrs[:marked_for_deletion].to_s == '1'
            o.destroy
          else
            o.attributes=attrs
          end
        rescue
          time_units.build(attrs)
        end
      end
      
      #
      #
      #
      def time_units_ordered_by_date(descending=true)
        if descending
          TimeUnit.find_ordered_by_date({:dateable_id => id, :dateable_type => self.class.base_class.name})
        else
          # Not implemented yet (as it currently isn't needed).
        end
      end
      
    end
  end
  
end