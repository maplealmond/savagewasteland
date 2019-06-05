require_relative 'deck.rb'

# Ammo Mags and Cells
data = Items.new(Squib.xlsx file: 'data/items.xlsx')
Squib::Deck.new(cards: data.name.size, layout: 'layouts/layout.yml') do
  common(self, data)

  text str: data.notes, layout: 'full_notes'

  # Output
  save_png prefix: "items_"
  save_pdf trim: 37.5
end