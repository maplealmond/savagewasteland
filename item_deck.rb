require_relative 'deck.rb'

# Ammo Boxes
data = Boxes.new(Squib.xlsx file: 'data/boxes.xlsx')
Squib::Deck.new(cards: data.name.size, layout: 'layouts/layout.yml') do
  common(self, data)

  # Check Boxes
  text str: data.boxes, layout: 'ammo_boxes'

  # Output
  save_png prefix: "boxes_"
  save_pdf file: "boxes.pdf", trim: 37.5
end

# Ammo Mags and Cells
data = Mags.new(Squib.xlsx file: 'data/mags.xlsx')
Squib::Deck.new(cards: data.name.size, layout: 'layouts/layout.yml') do
  common(self, data)

  # Check Boxes
  text str: data.boxes, layout: 'ammo_boxes'

  # Output
  save_png prefix: "mags_"
  save_pdf trim: 37.5
end