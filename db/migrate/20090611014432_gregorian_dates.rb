class GregorianDates < ActiveRecord::Migration
  def self.up
    create_table :gregorian_dates do |t|
      t.string :gregorian_year
      t.string :gregorian_year_certainty, :default => "Certain" 
      
      t.string :gregorian_month
      t.string :gregorian_month_certainty, :default => "Certain"
      
      t.string :gregorian_day
      t.string :gregorian_day_certainty, :default => "Certain"
      
      t.string :gregorian_day_of_week
      t.string :gregorian_day_of_week_certainty, :default => "Certain"
      
      t.string :gregorian_season
      t.string :gregorian_season_certainty, :default => "Certain"
      
      t.integer :gregorian_hour
      t.string :gregorian_hour_certainty, :default => "Certain"
      
      t.integer :gregorian_minute
      t.string :gregorian_minute_certainty, :default => "Certain"
      
      t.integer :gregorian_time_of_day
      t.string :gregorian_time_of_day_certainty, :default => "Certain"
      
      t.string :gregorian_am_pm
      t.string :gregorian_am_pm_certainty, :default => "Certain"
      t.integer :time_unit_id
      t.timestamps
    end
  end

  def self.down
    drop_table :gregorian_dates
  end
end
