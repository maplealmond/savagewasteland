require_relative 'items.rb'

class Aid < Items
  def file
    name.map{ |name| "img/aid/#{name.downcase.gsub(" ","_")}.png" }
  end
end