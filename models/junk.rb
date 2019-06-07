require_relative 'models.rb'

class Junk < Models
  def file
    name.map{ |name| "img/junk/#{name.downcase.gsub(" ","_")}.png" }
  end

  def header
    name.map{ |n| "Junk, #{n}" }
  end
end