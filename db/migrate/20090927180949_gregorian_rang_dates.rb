class GregorianRangDates < ActiveRecord::Migration
  def self.up
    create_table :gregorian_range_dates do |t|
      t.string :gregorian_start_year
      t.string :gregorian_end_year, :null => true
      t.string :gregorian_year_certainty, :default => "Certain"
      
      t.string :gregorian_start_month
      t.string :gregorian_end_month, :null => true
      t.string :gregorian_month_certainty, :default => "Certain"
      
      t.string :gregorian_start_day
      t.string :gregorian_end_day, :null => true
      t.string :gregorian_day_certainty, :default => "Certain"
      
      t.string :gregorian_start_day_of_week
      t.string :gregorian_end_day_of_week, :null => true
      t.string :gregorian_day_of_week_certainty, :default => "Certain"
      
      t.string :gregorian_start_season
      t.string :gregorian_end_season, :null => true
      t.string :gregorian_season_certainty, :default => "Certain"
      
      t.integer :gregorian_start_hour
      t.integer :gregorian_end_hour, :null => true
      t.string :gregorian_hour_certainty, :default => "Certain"
      
      t.integer :gregorian_start_minute
      t.integer :gregorian_end_minute, :null => true
      t.string :gregorian_minute_certainty, :default => "Certain"
      
      t.integer :gregorian_start_time_of_day
      t.integer :gregorian_end_time_of_day, :null => true
      t.string :gregorian_time_of_day_certainty, :default => "Certain"
      
      t.string :start_am_pm
      t.string :end_am_pm
      t.string :am_pm_certainty, :default => "Certain"
      
      t.integer :time_unit_id
      t.boolean :start_range, :default => true
      
      t.timestamps
    end
  end

  def self.down
    drop_table :gregorian_range_dates
  end
end
