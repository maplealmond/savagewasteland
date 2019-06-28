require 'squib'
require 'squib/sample_helpers'
require 'game_icons'

require_relative '../models/npcs'

LAYOUTS = [
  'layouts/npcs/template.yml',
  'layouts/npcs/npc.yml'
]

# NPCs
data = Npcs.new(Squib.xlsx file: 'data/npcs.xlsx')
Squib::Deck.new(cards: data.name.size, layout: LAYOUTS, height: 1049, width: 754) do

  png file: 'img/backgrounds/extra_front.png', layout: 'background'

  text str: data.header, layout: 'header'

  text str: data.ag, layout: 'agility'
  text str: data.sm, layout: 'smarts'
  text str: data.sp, layout: 'spirit'
  text str: data.st, layout: 'strength'
  text str: data.vg, layout: 'vigor'

  text str: data.pace, layout: 'pace'
  text str: data.parry, layout: 'parry'
  text str: data.toughness, layout: 'toughness'
  text str: data.carry, layout: 'carry'

  text str: data.textblock, markup: true, layout: 'textblock'

  # Output
  save_png prefix: "npc_"
  save_pdf file: "npcs.pdf", gap: 30
end