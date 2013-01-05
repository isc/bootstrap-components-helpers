Gem::Specification.new do |s|
  s.name         = 'bootstrap-components-helpers'
  s.summary      = 'Accordion view helper for Twitter Bootstrap'
  s.description  = 'A micro gem providing an accordion view helper that generates the proper markup for Twitter Bootstrap. Modified by Graham to specify open accordion pane right on pane'
  s.version      = '0.0.2'
  s.platform     = Gem::Platform::RUBY

  s.files        = ['bootstrap-components-helpers.rb', 'accordion_helper.rb', 'tabs_helper.rb']
  s.require_path = '.'

  s.authors     = ['Ivan Schneider', 'Graham Torn']
  s.email       = 'git@ivanschneider.fr'
  s.homepage    = 'https://dbinsights.herokuapp.com'

  # s.test_file    = '_spec.rb'
  # s.add_development_dependency('rspec', ["~> 2.8"])
end
