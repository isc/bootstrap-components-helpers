Gem::Specification.new do |s|
  s.name         = 'bootstrap-components-helpers'
  s.summary      = 'Accordion view helper for Twitter Bootstrap'
  s.description  = 'A micro gem providing an accordion view helper that generates the proper markup for Twitter Bootstrap'
  s.version      = '0.0.1'
  s.platform     = Gem::Platform::RUBY

  s.files        = ['bootstrap-components-helpers.rb', 'accordion-helper.rb', 'tabs-helper.rb']
  s.require_path = '.'

  s.author      = 'Ivan Schneider'
  s.email       = 'git@ivanschneider.fr'
  s.homepage    = 'https://dbinsights.herokuapp.com'

  # s.test_file    = '_spec.rb'
  # s.add_development_dependency('rspec', ["~> 2.8"])
end
