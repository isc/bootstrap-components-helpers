Gem::Specification.new do |s|
  s.name         = 'bootstrap-components-helpers'
  s.summary      = 'View helpers for Twitter Bootstrap components'
  s.description  = 'View helpers that generate the proper markup for some Twitter Bootstrap components'
  s.version      = '0.0.6'
  s.platform     = Gem::Platform::RUBY

  s.files        = Dir['README.markdown', 'lib/**/*']
  s.test_files   = Dir["test/**/*.rb"]
  s.require_path = 'lib'

  s.author      = 'Ivan Schneider'
  s.email       = 'git@ivanschneider.fr'
  s.homepage    = 'https://github.com/isc/bootstrap-components-helpers'
  s.license     = 'MIT'
  s.add_dependency 'actionpack', '>= 3.2.0'
end
