require_relative 'weapons.rb'

class Melee < Weapons
  def damage
    data['Damage'].zip(data['AP']).map{ |x| x[1].to_i > 0 ? "#{x[0]}; AP#{x[1]}" : x[0] }
  end

  def damage_icon
    GameIcons.get('glass-heart').recolor(fg: '#000000', bg_opacity: 0).string
  end
end