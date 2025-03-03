require_relative 'item.rb'
require_relative '../../models/aid'

data = Aid.new(Squib.xlsx file: 'data/aid.xlsx', explode: "Qty")
Squib::Deck.new(cards: data.name.size, layout: LAYOUTS) do
  common(self, data)

  text str: data.notes, layout: 'full_notes', markup: true

  # Check Boxes
  text str: data.boxes, layout: 'usage_boxes'

  # Output
  # save_png prefix: "aid"
  save_pdf file: "aid.pdf"
end