require 'squib'
require 'squib/sample_helpers'
require 'game_icons'

require './models/guns.rb'

#`rm _output/*`

data = Squib.xlsx file: 'data/guns.xlsx'
guns = Guns.new(data)

Squib::Deck.new(cards: guns.name.size, layout: 'layouts/weapons.yml') do
  background color: 'white'

  # Artwork
  png file: guns.file, layout: 'art'

  # Template
  png file: 'img/template.png', layout: 'template'

  #Header
  text str: guns.header, layout: 'title'
  text str: guns.weight, layout: 'weight'
  text str: guns.value, layout: 'value'


  guns.icon_text_pair(context: self, x: 80, y: 680, name: "strength")
  guns.icon_text_pair(context: self, x: 80, y: 750, name: "shots")

  guns.icon_text_pair(context: self, x: 350, y: 680, name: "damage")
  guns.icon_text_pair(context: self, x: 350, y: 750, name: "range")

  6.times do |i|
    rect x: 720, y: 680 + i * 40, height: 30, width: 30, color: 'black'
  end

  text str: guns.notes, layout: 'notes'

  # Output
  save_png prefix: "guns_"
  save_pdf trim: 37.5
end
