require_relative 'items.rb'

class Aid < Items
  def file
    name.map{ |name| "img/aid/#{name.downcase.gsub(" ","_")}.png" }
  end

  def capacity
    data['Capacity']
  end

  def boxes
    return if capacity.empty?
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