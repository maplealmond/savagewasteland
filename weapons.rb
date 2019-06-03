require 'squib'
require 'squib/sample_helpers'
require 'game_icons'


class WeaponList
  def initialize(data)
    @data = data
  end

  def data
    @data
  end

  def name
    data['name']
  end

  def header
    name.zip(data['ammo']).map{ |x| x[0].to_s + " (#{x[1]})" }
  end

  def file
    name.map{ |name| "img/weapons/#{name.downcase.gsub(" ","_")}.png" }
  end

  def damage
    data['damage'] #TODO, Zip in AP
  end

  def weight
    data['weight']
  end

  def range
    data['range'].map { |r| "#{r}/#{r*2}/#{r*3}"}
  end

  def shots
    data['shots']
  end

  def strength
    data['strength']
  end

  def notes
    data['notes']
  end
end

#`rm _output/*`

data = Squib.csv file: 'data/weapons.csv'
weapon = WeaponList.new(data)

Squib::Deck.new(cards: data['name'].size, layout: 'layouts/weapons.yml') do
  background color: 'white'

  # Artwork
  png file: weapon.file, layout: 'art'

  # Template
  png file: 'img/stats_background.png', layout: 'stats_background'
  png file: 'img/template.png', layout: 'template'

  #Header
  text str: weapon.header, layout: 'title'
  text str: weapon.weight, layout: 'weight'

  # Icons

  # Stats
  base = 740
  offset = 35
  [:damage, :range, :shots, :strength, :notes].each_with_index do |stat, index|
    unless weapon.send(stat).empty?
      text y: base + index * offset, str: "#{stat.capitalize}:", layout: 'stats_lead'
      text y: base + index * offset, str: weapon.send(stat), layout: 'stats_entry'
    end
  end

  # Output
  save_png prefix: "weapon_"
  save_pdf trim: 37.5
end
