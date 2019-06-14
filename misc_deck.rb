require_relative 'deck.rb'

data = Misc.new(Squib.xlsx file: 'data/misc.xlsx')
Squib::Deck.new(cards: data.name.size, layout: LAYOUTS) do
  common(self, data)

  text str: data.notes, layout: 'full_notes'

  # Output
  # save_png prefix: "junk_"
  save_pdf file: "misc.pdf"
end