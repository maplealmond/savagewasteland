require 'squib'
require 'squib/sample_helpers'
require 'game_icons'

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/models/*') {|file| require file}

def common(context, data)
  context.background color: 'white'

  # Artwork
  context.png file: data.file, layout: 'art'

  # Template
  context.png file: 'img/template.png', layout: 'template'

  # Header
  context.text str: data.header, layout: 'title'
  context.text str: data.weight, layout: 'weight'
  context.text str: data.value, layout: 'value'
end

# Ammo Mags and Cells
data = Mags.new(Squib.xlsx file: 'data/mags.xlsx')
Squib::Deck.new(cards: data.name.size, layout: 'layouts/layout.yml') do
  common(self, data)

  # Check Boxes
  text str: data.boxes, layout: 'ammo_boxes'

  # Output
  save_png prefix: "mags_"
  save_pdf trim: 37.5
end