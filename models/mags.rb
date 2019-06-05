require_relative 'models.rb'

class Mags < Models
  def file
    name.map{ |name| "img/mags/#{name.downcase.gsub(" ","_")}.png" }
  end

  def ammo
    data['Ammo'].map{ |a| format_ammo(a) }
  end

  def capacity
    data['Capacity']
  end

  def boxes
    capacity.map do |i|
      i = i.to_i
      div = div(i)
      row = "☐" * div
      remain = "☐" * (i % div)
      ([row] * (i/div) + [remain]).join(" ")
    end
  end

  def div(i)
    [5,6,4].each do |div|
      return div if (i % div) == 0
    end
    return 5
  end
end