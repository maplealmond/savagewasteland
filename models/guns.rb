class Guns
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def name
    data['Name']
  end

  def header
    name
  end

  def ammo
    data['Ammo']
  end

  def file
    name.map{ |name| "img/weapons/#{name.downcase.gsub(" ","_")}.png" }
  end

  def damage
    data['Damage'].zip(data['AP']).map{ |x| x[1].to_i > 0 ? "#{x[0]} (AP #{x[1]})" : x[0] }
  end

  def weight
    data['Weight']
  end

  def range
    data['Range']
  end

  def rof
    data['ROF']
  end

  def shots
    data['Shots'].zip(data['Ammo']).map{ |x| "#{x[0]}x#{x[1]}" }
  end

  def strength
    data['Strength']
  end

  def notes
    data['Notes']
  end

  def value
    data['Value']
  end

  def damage_icon
    GameIcons.get('glass-heart').recolor(fg: '#000000', bg_opacity: 0).string
  end

  def range_icon
    GameIcons.get('crosshair').recolor(fg: '#000000', bg_opacity: 0).string
  end

  def strength_icon
    GameIcons.get('weight-lifting-up').recolor(fg: '#000000', bg_opacity: 0).string
  end

  def shots_icon
    data['Ammo'].map do |ammo|
      if ammo == "Cell"
        GameIcons.get('battery-pack').recolor(fg: '#000000', bg_opacity: 0).string
      else
        GameIcons.get('ammo-box').recolor(fg: '#000000', bg_opacity: 0).string
      end
    end
  end

  def icon_text_pair(context:, x:, y:, name:)
    context.svg x: x, y: y, data: send("#{name}_icon".to_s), layout: 'icon'
    context.text x: x + 60, y: y, str: send(name), layout: 'statistics'
  end
end