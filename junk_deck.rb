require_relative 'deck.rb'

# Ammo Mags and Cells
data = Junk.new(Squib.xlsx file: 'data/junk.xlsx')
Squib::Deck.new(cards: data.name.size, layout: LAYOUTS) do
  common(self, data)

  text str: data.notes, layout: 'full_notes'

  # Output
  # save_png prefix: "junk_"
  save_pdf file: "junk.pdf"
end