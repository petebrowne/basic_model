require 'bundler'

Gem::Specification.new do |s|
  s.name        = 'basic_model'
  s.version     = '0.1'
  s.summary     = 'BasicModel is a tiny Class that complies with the ActiveModel API'
  s.description = 'BasicModel is intended to be used as a tableless model in Rails. It complies with the ActiveModel API and includes valdiations, so it can be used in form helpers without a problem.'
  
  s.authors           = 'Pete Browne'
  s.email             = 'me@petebrowne.com'
  s.homepage          = 'http://github.com/petebrowne/basic_model'
  s.rubyforge_project = 'basic_model'
  
  s.files = %w(lib/basic_model.rb LICENSE README.md)
  
  s.add_bundler_dependencies
end
