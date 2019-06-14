require 'squib'
require 'squib/sample_helpers'
require 'game_icons'

LAYOUTS = [
    'layouts/frame.yml',
    'layouts/item.yml',
    'layouts/layout.yml'
]

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/models/*') {|file| require file}

def common(context, data)
  context.png layout: 'art', file: data.file

  line layout: 'title_frame'
  rect layout: 'stats_frame'

  text layout: 'title', str: data.header

  circle layout: 'weight_frame'
  text layout: 'weight', str: data.weight

  rect layout: 'backdrop'

  rect layout: 'value_frame'
  text layout: 'value', str: data.value
end

