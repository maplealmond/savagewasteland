require_relative 'items.rb'

class Boxes < Weapons
  def file
    name.map{ |name| "img/boxes/#{name.downcase.gsub(" ","_")}.png" }
  end

  def header
    list_merge(name, capacity) { |name, capacity| "Box of #{format_ammo(name)} (#{capacity})" }
  end
end