require_relative 'deck.rb'

data = Guns.new(Squib.xlsx file: 'data/guns.xlsx')
Squib::Deck.new(cards: data.name.size, layout: 'layouts/layout.yml') do
  common(self, data)

  # Stats
  data.icon_text_pair(context: self, x: 80, y: 680, name: "strength")
  data.icon_text_pair(context: self, x: 80, y: 750, name: "ammo")
  data.icon_text_pair(context: self, x: 350, y: 680, name: "damage")
  data.icon_text_pair(context: self, x: 350, y: 750, name: "range")

  # Condition Boxes
  6.times do |i|
    rect x: 720, y: 680 + i * 40, layout: "condition"
    text x: 720, y: 680 + i * 40, layout: "condition", str: (i > 2 ? 2-i : ""), color: "gray"
  end

  # Extras
  text str: data.notes, layout: 'notes'

  # Output
  save_png prefix: "guns_"
  save_pdf trim: 37.5
end
