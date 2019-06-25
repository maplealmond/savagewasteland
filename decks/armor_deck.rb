require_relative 'item.rb'
require_relative '../models/armor'

data = Armor.new(Squib.xlsx file: 'data/armor.xlsx')
Squib::Deck.new(cards: data.name.size, layout: LAYOUTS) do
  common(self, data)

  # Stats
  data.icon_text_pair(context: self, x: 0, y: 0, name: "armor")
  data.icon_text_pair(context: self, x: 1, y: 0, name: "strength")

  # Condition Boxes
  6.times do |i|
    rect x: 720, y: 680 + i * 40, layout: "condition"
    #text x: 720, y: 680 + i * 40, layout: "condition", str: (i > 2 ? 2-i : ""), color: "gray"
  end

  # Extras
  text str: data.notes, layout: 'full_notes'

  # Output
  # save_png prefix: "armor_"
  save_pdf file: "armor.pdf"
end
