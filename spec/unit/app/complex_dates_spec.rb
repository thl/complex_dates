require 'rails_helper'

RSpec.describe ComplexDates do
  describe "Creation" do
    context "Valid" do
      let (:georgian_calendar)   { Calendar.find(1) }
      let (:tibetan_calendar)    { Calendar.find(2) }

      let (:certainty_certain)   { Certainty.find(1) }
      let (:certainty_probable)  { Certainty.find(2) }
      let (:certainty_estimated) { Certainty.find(3) }

      let (:season_spring)       { Season.find(1) }
      let (:season_summer)       { Season.find(2) }
      let (:season_fall)         { Season.find(3) }
      let (:season_winter)       { Season.find(4) }

      it "Basic Gregorian date" do
        day = 29
        month = 02
        year = 2000
        complex_date = ComplexDate.create(day: day,
                                          day_certainty_id: certainty_certain,
                                          month: month,
                                          month_certainty_id: certainty_certain,
                                          year: year,
                                          year_certainty_id: certainty_certain,
                                          season_id: season_spring,
                                          season_certainty_id: certainty_certain)
        expect(complex_date.valid?).to eq(true)
      end

      it "Range Gregorian date" do
        start_date = {
          day: 29,
          month: 02,
          year: 2000
        }
        end_date = {
          day: 31,
          month: 3,
          year: 2000
        }

        complex_date = ComplexDate.create(
          day: start_date[:day],
          day_end: end_date[:day],
          day_certainty_id: certainty_certain,
          month: start_date[:month],
          month_end: end_date[:month],
          month_certainty_id: certainty_certain,
          year: start_date[:year],
          year_end: end_date[:year],
          year_certainty_id: certainty_certain,
          season_id: season_spring,
          season_certainty_id: certainty_certain
        )

        expect(complex_date.valid?).to eq(true)
      end

    end
  end
end
