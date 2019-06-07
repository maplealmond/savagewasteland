require_relative 'models.rb'

class Misc < Models
  def file
    name.map{ |name| "img/#{self.class.to_s.downcase}/#{name.downcase.gsub(" ","_")}.png" }
  end
end