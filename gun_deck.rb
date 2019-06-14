require_relative 'deck.rb'

data = Guns.new(Squib.xlsx file: 'data/guns.xlsx')
Squib::Deck.new(cards: data.name.size, layout: LAYOUTS) do
  common(self, data)

  # Stats
  data.icon_text_pair(context: self, x: 0, y: 0, name: "damage")
  data.icon_text_pair(context: self, x: 0, y: 1, name: "rof")
  data.icon_text_pair(context: self, x: 0, y: 2, name: "range")

  data.icon_text_pair(context: self, x: 1, y: 0, name: "strength")
  data.icon_text_pair(context: self, x: 1, y: 1, name: "ammo")
  data.text(context: self, x: 1, y: 2, name: "boxes")

  # Condition Boxes
  6.times do |i|
    rect x: 720, y: 650 + i * 40, layout: "condition"
    text x: 720, y: 650 + i * 40, layout: "condition", str: (i > 2 ? 2-i : ""), color: "gray"
  end

  # Extras
  text str: data.notes, layout: 'notes'

  # Output
  # save_png prefix: "guns_"
  save_pdf file: "guns.pdf"
end

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
Squib::Deck.new(cards: data.name.size, layout: LAYOUTS) do
  common(self, data)

  # Check Boxes
  text str: data.boxes, layout: 'ammo_boxes'

  # Output
  # save_png prefix: "mags_"
  save_pdf file: "mags.pdf"
end