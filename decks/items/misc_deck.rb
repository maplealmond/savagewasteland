require_relative 'item.rb'
require_relative '../../models/misc'

data = Misc.new(Squib.xlsx file: 'data/misc.xlsx', explode: "Qty")
Squib::Deck.new(cards: data.name.size, layout: LAYOUTS) do
  common(self, data)

  text str: data.notes, layout: 'full_notes'

  # Output
  # save_png prefix: "misc_"
  save_pdf file: "misc.pdf"
end