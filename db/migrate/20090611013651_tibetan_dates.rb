class TibetanDates < ActiveRecord::Migration
  def self.up
    create_table :tibetan_dates do |t|
      t.string :calendrical
      t.string :calendrical_certainty, :default => "Certain" 
      
      t.integer :rabjung
      t.string :rabjung_certainty, :default => "Certain"
      
      t.string :element
      t.string :element_certainty, :default => "Certain" 
      
      t.string :animal
      t.string :animal_certainty, :default => "Certain" 
      
      t.string :gender
      t.string :gender_certainty, :default => "Certain" 
      
      t.integer :tibetan_month
      t.string :tibetan_month_certainty, :default => "Certain" 
      
      t.string :tibetan_intercalary_month
      t.string :tibetan_intercalary_month_certainty, :default => "Certain" 
      
      t.string :tibetan_day
      t.string :tibetan_day_certainty, :default => "Certain" 
      
      t.string :tibetan_intercalary_day
      t.string :tibetan_intercalary_day_certainty, :default => "Certain" 
      
      t.integer :tibetan_hour
      t.string :tibetan_hour_certainty, :default => "Certain" 
      
      t.integer :tibetan_minute
      t.string :tibetan_minute_certainty, :default => "Certain" 
      
      t.integer :tibetan_time_of_day
      t.string :tibetan_time_of_day_certainty, :default => "Certain" 
      
      t.string :tibetan_am_pm
      t.string :tibetan_am_pm_certainty, :default => "Certain" 
      
      t.integer :time_unit_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tibetan_dates
  end
end
