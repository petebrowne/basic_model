task :default => :test

#------------------------------------
#  Tests
#------------------------------------

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
end

#------------------------------------
#  Console
#------------------------------------

desc 'Open an irb session preloaded with this library'
task :console do
  sh 'irb -rubygems -I lib -r basic_model.rb'
end

#------------------------------------
#  Packaging
#------------------------------------

def spec
  @spec ||= eval File.read('basic_model.gemspec')
end

require 'rake/gempackagetask'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc 'Install the gem locally'
task :install => :package do
  sh %{gem install pkg/basic_model-#{spec.version}}
end

desc 'Release the gem'
task :release => :package do
  sh %{gem push pkg/basic_model-#{spec.version}.gem}
end

desc 'Validate the gemspec'
task :gemspec do
  spec.validate
end

task :package => :gemspec
