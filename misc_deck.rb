require_relative 'deck.rb'

data = Misc.new(Squib.xlsx file: 'data/misc.xlsx')
Squib::Deck.new(width: 825, height: 1075, cards: data.name.size, layout: 'layouts/layout.yml') do
  common(self, data)

  text str: data.notes, layout: 'full_notes'

  # Output
  # save_png prefix: "junk_"
  save_pdf file: "misc.pdf"
end