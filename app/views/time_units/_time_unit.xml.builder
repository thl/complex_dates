xml.time_unit do
  xml.id(time_unit.id, type: 'integer')
  calendar_id = time_unit.calendar_id
  xml.calendar(Calendar.find(calendar_id).name) if !calendar_id.nil?
  xml.is_range(time_unit.is_range, type: 'boolean')
  date = time_unit.date
  xml.date(date.to_s)
  date = time_unit.start_date
  xml.start_date(date.to_s)
  date = time_unit.end_date
  xml.end_date(date.to_s)
  xml.created_at(time_unit.created_at, type: 'timestamp')
  xml.updated_at(time_unit.updated_at, type: 'timestamp')
  freq = time_unit.frequency
  xml.frequency(freq.title) if !freq.nil?
end