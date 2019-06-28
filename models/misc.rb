require_relative 'items.rb'

class Misc < Items
  def file
    name.map{ |name| "img/#{self.class.to_s.downcase}/#{name.downcase.gsub(" ","_")}.png" }
  end
end