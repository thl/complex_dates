class TimeUnits < ActiveRecord::Migration
  def self.up
     create_table :time_units do |t|
      t.string :point_range
      t.string :date_type
      t.timestamps
     end
  end

  def self.down
    drop_table :time_units
  end
end
