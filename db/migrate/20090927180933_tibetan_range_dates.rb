class TibetanRangeDates < ActiveRecord::Migration
  def self.up
    create_table :tibetan_range_dates do |t|
      t.string :calendrical
      t.string :calendrical_certainty, :default => "Certain"
      
      t.integer :rabjung_start
      t.integer :rabjung_end, :null => true
      t.string :rabjung_certainty, :default => "Certain"
      
      t.string :element
      t.string :element_certainty, :default => "Certain"
      
      t.string :animal
      t.string :animal_certainty, :default => "Certain"
      
      t.string :gender
      t.string :gender_certainty, :default => "Certain"
      
      t.integer :tibetan_start_month
      t.integer :tibetan_end_month, :null => true
      t.string :tibetan_month_certainty, :default => "Certain"
      
      t.string :tibetan_intercalary_month
      t.string :tibetan_intercalary_month_certainty, :default => "Certain"
      
      t.string :tibetan_start_day
      t.string :tibetan_end_day, :null => true
      t.string :tibetan_day_certainty, :default => "Certain"
      
      t.string :tibetan_intercalary_day
      t.string :tibetan_intercalary_day_certainty, :default => "Certain"
      
      t.integer :tibetan_start_hour
      t.integer :tibetan_end_hour, :null => true   
      t.string :tibetan_hour_certainty, :default => "Certain"
      
      t.integer :tibetan_start_minute
      t.integer :tibetan_end_minute, :null => true
      t.string :tibetan_minute_certainty, :default => "Certain"
      
      t.integer :tibetan_start_time_of_day
      t.integer :tibetan_end_time_of_day, :null => true
      t.string :tibetan_time_of_day_certainty, :default => "Certain"
      
      t.string :tibetan_first_am_pm
      t.string :tibetan_end_am_pm, :null => true
      t.string :tibetan_am_pm_certainty, :default => "Certain"
      
      t.integer :time_unit_id
      t.boolean :start_range, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :tibetan_range_dates
  end
end
