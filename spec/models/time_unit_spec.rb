require 'rails_helper'
  module KmapsEngine
    module IsNotable
    end
  end
RSpec.describe TimeUnit, type: :model do

 context "Valid creation" do
   it "Should create" do
     gregorian_date = GregorianDate.create(year:1950, year_certainty_id: 1)
     time_unit = TimePoint.create(date: gregorian_date, dateable: gregorian_date)

     expect(time_unit).to be_valid
   end
 end 
end
