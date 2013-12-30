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
      
      # This is currently fairly rudimentary, as it isn't being put to important use yet.
      # Currently, it sorts all Gregorian dates before all Tibetan dates, then sorts by the
      # fields listed below of either date or end_date, depending on whether the TimeUnit
      # is a point or range.
      def time_units_ordered_by_date
        order_array = ['time_units.calendar_id ASC'] + %w[rabjung_id year season_id month day hour minute].collect{|field| "complex_dates.#{field} DESC"}
        self.time_units.order(order_array.join(', ')).includes([:date, :end_date])
      end
    end
  end
end