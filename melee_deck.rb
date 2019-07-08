require_relative 'deck.rb'

data = Melee.new(Squib.xlsx file: 'data/melee.xlsx')
Squib::Deck.new(cards: data.name.size, layout: 'layouts/layout.yml') do
  common(self, data)

  # Stats
  data.icon_text_pair(context: self, x: 0, y: 0, name: "damage")
  data.icon_text_pair(context: self, x: 0, y: 1, name: "strength")

  # Condition Boxes
  6.times do |i|
    rect x: 720, y: 680 + i * 40, layout: "condition"
    text x: 720, y: 680 + i * 40, layout: "condition", str: (i > 2 ? 2-i : ""), color: "gray"
  end

  # Extras
  text str: data.notes, layout: 'notes'

  # Output
  # save_png prefix: "guns_"
  save_pdf file: "melee.pdf", trim: 37.5
end
