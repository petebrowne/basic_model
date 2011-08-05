Gem::Specification.new do |s|
  s.name        = 'basic_model'
  s.version     = '0.3.0'
  s.summary     = 'BasicModel is a tiny Module that complies with the ActiveModel API'
  s.description = 'BasicModel is intended to be used in a tableless model in Rails >= 3.0. It complies with the ActiveModel API and includes valdiations, so it can be used in form helpers without a problem.'
  
  s.authors           = 'Pete Browne'
  s.email             = 'me@petebrowne.com'
  s.homepage          = 'http://github.com/petebrowne/basic_model'
  s.rubyforge_project = 'basic_model'
  
  s.files = %w(lib/basic_model.rb LICENSE README.md)
  
  s.add_dependency 'activemodel',   '~> 3.0'
  s.add_dependency 'activesupport', '~> 3.0'
  
  s.add_development_dependency 'rake'
end
