require_relative 'deck.rb'

# Ammo Mags and Cells
data = Aid.new(Squib.xlsx file: 'data/aid.xlsx')
Squib::Deck.new(cards: data.name.size, layout: LAYOUTS) do
  common(self, data)

  text str: data.notes, layout: 'full_notes'

  # Check Boxes
  text str: data.boxes, layout: 'usage_boxes'

  # Output
  save_pdf file: "aid.pdf"
end