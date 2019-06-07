require_relative 'models.rb'

class Weapons < Models
  def file
    name.map{ |name| "img/weapons/#{name.downcase.gsub(" ","_")}.png" }
  end

  def damage
    data['Damage'].zip(data['AP']).map{ |x| x[1].to_i > 0 ? "#{x[0]}; AP#{x[1]}" : x[0] }
  end

  def strength
    data['Strength']
  end

  def damage_icon
    GameIcons.get('glass-heart').recolor(fg: '#000000', bg_opacity: 0).string
  end

  def strength_icon
    GameIcons.get('weight-lifting-up').recolor(fg: '#000000', bg_opacity: 0).string
  end
end