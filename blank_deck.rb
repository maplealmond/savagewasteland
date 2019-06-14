require_relative 'deck.rb'

LAYOUTS = [
    'layouts/frame.yml',
    'layouts/item.yml'
]

files = []

Dir.glob('./img/**/*.png').each do|f|
  files << f
end

# Blank test deck
Squib::Deck.new(width: 825, height: 1125, cards: files.length, layout: LAYOUTS) do

  png layout: 'art', file: files

  line layout: 'title_frame'
  rect layout: 'stats_frame'

  text layout: 'title', str: "Longest Title"


  circle layout: 'weight_frame'
  text layout: 'weight', str: "5"

  rect layout: 'backdrop'

  rect layout: 'value_frame'
  text layout: 'value', str: "c100"

  #save_png
  save_pdf file: "template.pdf"
end