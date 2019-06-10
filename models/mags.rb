require_relative 'models.rb'

class Mags < Weapons
  def file
    name.map{ |name| "img/mags/#{name.downcase.gsub(" ","_")}.png" }
  end

  def ammo
    data['Ammo'].map{ |a| format_ammo(a) }
  end
end