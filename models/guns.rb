require_relative 'weapons.rb'

class Guns < Weapons
  def ammo
    data['Ammo'].map{ |a| format_ammo(a) }
  end

  def range
    data['Range']
  end

  def rof
    data['ROF'].map{ |x| "ROF #{x}" }
  end

  def range_icon
    GameIcons.get('crosshair').recolor(fg: '#000000', bg_opacity: 0).string
  end

  def rof_icon
    GameIcons.get('laser-sparks').recolor(fg: '#000000', bg_opacity: 0).string
  end
end