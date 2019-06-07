require_relative 'models.rb'

class Armor < Models
  def damage
    data['Damage'].zip(data['AP']).map{ |x| x[1].to_i > 0 ? "#{x[0]}; AP#{x[1]}" : x[0] }
  end

  def armor
    data['Armor'].map{ |x| "+#{x}"}
  end

  def strength
    data['Strength']
  end

  def armor_icon
    GameIcons.get('armor-upgrade').recolor(fg: '#000000', bg_opacity: 0).string
  end

  def strength_icon
    GameIcons.get('weight-lifting-up').recolor(fg: '#000000', bg_opacity: 0).string
  end
end