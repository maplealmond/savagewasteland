require_relative 'models.rb'

class Boxes < Weapons
  def file
    name.map{ |name| "img/boxes/#{name.downcase.gsub(" ","_")}.png" }
  end

  def header
    name.zip(capacity).map{ |n| "Box of #{format_ammo(n[0])} (#{n[1]})" }
  end
end