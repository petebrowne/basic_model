# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'basic_model/version'

Gem::Specification.new do |s|
  s.name        = 'basic_model'
  s.version     = BasicModel::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Pete Browne']
  s.email       = ['me@petebrowne.com']
  s.homepage    = 'http://github.com/petebrowne/basic_model'
  s.summary     = 'BasicModel is a tiny Module that complies with the ActiveModel API'
  s.description = 'BasicModel is intended to be used in a tableless model in Rails >= 3.0. It complies with the ActiveModel API and includes valdiations, so it can be used in form helpers without a problem.'
  
  s.rubyforge_project = 'basic_model'
  
  s.add_dependency 'activemodel',   '~> 3.0'
  s.add_dependency 'activesupport', '~> 3.0'
  s.add_development_dependency 'rake'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w(lib)
end
