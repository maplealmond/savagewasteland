require_relative 'deck.rb'

# Ammo Boxes
data = Boxes.new(Squib.xlsx file: 'data/guns.xlsx', sheet: 1)
Squib::Deck.new(cards: data.name.size, layout: LAYOUTS) do
  common(self, data)

  # Check Boxes
  text str: data.boxes, layout: 'ammo_boxes'

  # Output
  # save_png prefix: "boxes_"
  save_pdf file: "boxes.pdf"
end

# Ammo Mags and Cells
data = Mags.new(Squib.xlsx file: 'data/guns.xlsx', sheet: 2)
Squib::Deck.new(cards: data.name.size, layout: 'layouts/layout.yml') do
  common(self, data)

  # Check Boxes
  text str: data.boxes, layout: 'ammo_boxes'

  # Output
  # save_png prefix: "mags_"
  save_pdf file: "mags.pdf"
end