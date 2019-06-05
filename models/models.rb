class Models
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

  def weight
    data['Weight']
  end

  def value
    data['Value'].map{ |v| "c#{v}" }
  end

  def notes
    data['Notes']
  end

  def format_ammo(ammo)
    ammo.sub("x",".")
  end

  def ammo_icon
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