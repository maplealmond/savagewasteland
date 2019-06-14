require_relative 'deck.rb'

# Ammo Mags and Cells
data = Aid.new(Squib.xlsx file: 'data/aid.xlsx')
Squib::Deck.new(width: 825, height: 1075, cards: data.name.size, layout: 'layouts/layout.yml') do
  common(self, data)

  text str: data.notes, layout: 'full_notes'

  # Check Boxes
  text str: data.boxes, layout: 'usage_boxes'

  # Output
  save_pdf file: "aid.pdf", trim: 37.5
end