require 'squib'
require 'squib/sample_helpers'
require 'game_icons'

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/models/*') {|file| require file}

def common(context, data)
  context.background color: 'white'

  # Artwork
  context.png file: data.file, layout: 'art'

  # Template
  context.png file: 'img/template.png', layout: 'template'

  # Header
  context.text str: data.header, layout: 'title'
  context.text str: data.weight, layout: 'weight'
  context.text str: data.value, layout: 'value'
end