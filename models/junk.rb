require_relative 'items.rb'

class Junk < Items
  def file
    name.map{ |name| "img/junk/#{name.downcase.gsub(" ","_")}.png" }
  end

  def header
    name
  end
end