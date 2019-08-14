require_relative 'items.rb'

class Weapons < Items
  def file
    name.map{ |name| "img/weapons/#{name.downcase.gsub(" ","_")}.png" }
  end

  def ammo
    data['Ammo'].map{ |a| format_ammo(a) }
  end

  def damage
    list_merge(dmg, ap) { |dmg, ap| ap.to_i > 0 ?  "#{dmg}; AP#{ap}" : dmg }
  end

  def dmg
    data['Damage']
  end

  def ap
    data['AP']
  end

  def strength
    data['Strength']
  end

  def damage_icon
    GameIcons.get('glass-heart').recolor(fg: '#000000', bg_opacity: 0).string
  end

  def condition(i)

    # If condition == 6, print 0,1,2,3,4,5
    # If condition == 5, print 1,2,3,4,5
    # If condition == 4, print 2,3,4,5
    # If condition == 3, print 3,4,5
    # If condition == 2, print 4,5
    # If condition == 1, print 5
    # If condition == 0, print []

    data["Condition"].map.with_index do |condition, index|
      if (condition.to_i + i) >= 6
        index
      else
        nil
      end
    end.compact.sort
  end

  def strength_icon
    GameIcons.get('weight-lifting-up').recolor(fg: '#000000', bg_opacity: 0).string
  end
end