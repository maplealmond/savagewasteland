class Npcs
  attr_reader :data

  # Takes a list of lists and returns a single merge
  # Useful when combining things like list_merge(names, levels)
  # Format block can be provided as well list_merge(names, levels) { |name, level| "#{name} (#{level})" }
  def list_merge(*lists)
    if block_given?
      lists.transpose.map{ |set| yield(*set) }
    else
      lists.transpose.map{ |x| x.join(" ") }
    end
  end

  SKILLS = %w(
    Athletics
    Knowledge
    Notice
    Persuasion
    Stealth
    Academics
    Battle
    Boating
    Driving
    Electronics
    Fighting
    Gambling
    Hacking
    Healing
    Intimidation
    Performance
    Piloting
    Repair
    Research
    Riding
    Science
    Shooting
    Survival
    Taunt
    Thievery
  ).freeze

  def initialize(data)
    @data = data
  end

  def name
    data['Name']
  end

  def header
    name
  end

  def ds(codes)
    codes.map{ |s| d(s) }
  end

  def d(s)
    "d#{2*(s.to_i+1)}"
  end

  %i(ag sm sp st vg).each do |attr|
    define_method attr do
      ds data[attr.to_s.capitalize]
    end
  end

  def block
    data["Skills"]
  end

  def pace
    data["Pace"]
  end

  def parry
    data["Parry"]
  end

  def toughness
    data["Toughness"]
  end

  def carry
    data["Carry"].map{ |c| "#{c}lb" }
  end

  def skills
    lists = SKILLS.map do |skill|
      data[skill].map do |v|
        v.to_i > 0 ? "#{skill}&#160;#{d(v)}" : ""
      end
    end

    lists.transpose.map{ |x| x.reject(&:empty?).join(", ") }
  end

  def textblock
    list_merge(skills, data["Edges"], data["Hinderances"]) do |skills, edges, hinderances|
      "<b>Skills</b>\n#{skills}\n\n" +
      "<b>Edges</b>\n#{edges}\n\n" +
      "<b>Hinderances</b>\n#{hinderances}\n\n"
    end
  end

end