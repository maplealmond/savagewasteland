require_relative 'items.rb'

class Armor < Items
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

  def condition(i)
    data["Condition"].map.with_index do |condition, index|
      if condition.to_i <= i
        nil
      else
        index
      end
    end.compact.sort
  end
end