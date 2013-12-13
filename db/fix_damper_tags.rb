inspections = Inspection.all
inspections.each do |inspection|
  inspection.tag = inspection.floor.to_s << "-" << inspection.damper_type.abbrev << "-" << inspection.damper_airstream.abbrev << "-" << inspection.unit.to_s << "-" << inspection.damper_id.to_s
  inspection.save 
end