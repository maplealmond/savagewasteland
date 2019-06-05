require_relative 'models.rb'

class Boxes < Models
  def file
    name.map{ |name| "img/boxes/#{name.downcase.gsub(" ","_")}.png" }
  end

  def header
    name.zip(capacity).map{ |n| "Box of #{format_ammo(n[0])} (#{n[1]})" }
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