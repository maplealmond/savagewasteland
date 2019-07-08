class Items
  attr_reader :data

  # Takes a list of lists and returns a single merge
  # Useful when combining things like list_merge(names, levels)
  # Format block can be provided as well list_merge(names, levels) { |name, level| "#{name} (#{level})" }
  def list_merge(*lists)
    if block_given?
      lists.transpose.map{ |set| yield(*set) }
    else
      lists.transpose.map{ |x| x.reject(&:nil?).join(" ") }
    end
  end

  def initialize(data)
    @data = data
  end

  def name
    data['Name']
  end

  def file
    name.map{ |name| "img/#{self.class.to_s.downcase}/#{name.downcase.gsub(" ","_")}.png" }
  end

  def header
    name
  end

  def weight
    data['Weight']
  end

  def value
    data['Value'].map{ |v| "c#{v}" }
  end

  def capacity
    data['Capacity']
  end

  def boxes
    capacity.map do |i|
      i = i.to_i
      div = div(i)
      row = "☐" * div
      remain = "☐" * (i % div)
      ([row] * (i/div) + [remain]).join(" ")
    end
  end

  def div(i)
    return 6 if i == 6
    return 5
  end

  def notes
    data['Notes'].map{ |n| n ? n.split("|").map(&:strip).join("\n") : "" }
  end

  def format_ammo(ammo)
    ammo.sub("x",".")
  end

  def ammo_icon
    data['Ammo'].map do |ammo|
      if ammo == "Energy Cell" or ammo == "Fusion Cell"
        GameIcons.get('battery-pack').recolor(fg: '#000000', bg_opacity: 0).string
      elsif ammo == "x357"
        GameIcons.get('chaingun').recolor(fg: '#000000', bg_opacity: 0).string
      else
        GameIcons.get('ammo-box').recolor(fg: '#000000', bg_opacity: 0).string
      end
    end
  end

  def icon_text_pair(context:, x:, y:, name:)
    px = 80 + 300 * x
    py = 650 + 70 * y

    context.svg x: px, y: py, data: send("#{name}_icon".to_s), layout: 'icon'
    context.text x: px + 60, y: py, str: send(name), layout: 'statistics'
  end

  def text(context:, x:, y:, name:)
    px = 80 + 300 * x
    py = 680 + 70 * y

    context.text x: px, y: py, str: send(name), layout: 'statistics'
  end
end