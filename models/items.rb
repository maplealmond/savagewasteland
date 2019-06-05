require_relative 'models.rb'

class Items < Models
  def file
    name.map{ |name| "img/items/#{name.downcase.gsub(" ","_")}.png" }
  end
end