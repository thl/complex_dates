xml.time_units(type: 'array') do
  xml << render(partial: 'time_units/time_unit.xml.builder', collection: time_units) if !time_units.empty?
end