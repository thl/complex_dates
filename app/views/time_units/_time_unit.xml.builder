xml.time_unit do
  xml.id(time_unit.id, type: 'integer')
  calendar_id = time_unit.calendar_id
  begin
    calendar = calendar_id.nil? ? nil : Calendar.find(calendar_id)
  rescue # have to check DB, why there are entries with calendar 0, 3 & 4!
    calendar = nil
  end
  xml.calendar(calendar.name) if !calendar.nil?
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
  xml.display_string(time_unit.to_s)
  # xml << render(partial: 'notes/index.xml.builder', locals: {notes: time_unit.notes})
end