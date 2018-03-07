prawn_document do |pdf|
  # Header
  pdf.formatted_text [{ text: "Audit Log: #{@object.id}", styles: [:bold] }]
  pdf.stroke_horizontal_rule
  pdf.move_down 5
  pdf.formatted_text [
      { text: "Object: ", styles: [:bold] },
      { text: @object.class.name.titleize }
                     ]

  # Changelog
  changes = [["Event", "Changes"]]
  @versions.each do |version|
    data = ""
    version.changeset.each do |attr, change|
      data += "* #{attr}: #{change[0]} -> #{change[1]}\n"
    end
    changes << [version.event.titleize, data]
  end
  pdf.font('Courier') { pdf.table(changes, header: true, column_widths: [75, 425]) }
end