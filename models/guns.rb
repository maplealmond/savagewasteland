require_relative 'models.rb'

class Guns < Models
  def file
    name.map{ |name| "img/weapons/#{name.downcase.gsub(" ","_")}.png" }
  end

  def ammo
    data['Ammo'].map{ |a| format_ammo(a) }
  end

  def damage
    data['Damage'].zip(data['AP']).map{ |x| x[1].to_i > 0 ? "#{x[0]} (AP#{x[1]})" : x[0] }
  end

  def range
    data['Range']
  end

  def rof
    data['ROF'].map{ |x| "ROF #{x}" }
  end

  def strength
    data['Strength']
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

  def rof_icon
    GameIcons.get('laser-sparks').recolor(fg: '#000000', bg_opacity: 0).string
  end
end