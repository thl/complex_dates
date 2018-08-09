class AddFrequencyIdToTimeUnit < ActiveRecord::Migration[5.2]
  def self.up
    add_column :time_units, :frequency_id, :integer
  end

  def self.down
    remove_column :time_units, :frequency_id
  end
end
