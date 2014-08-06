require 'rubygems'
require 'rubygems/package_task'
require 'rubygems/specification'
require 'date'
require 'rspec'
require 'rspec/core/rake_task'

GEM = 'apns'
GEM_NAME = 'apns'
GEM_VERSION = '0.9.0'
AUTHORS = ['James Pozdena']
EMAIL = "jpoz@jpoz.net"
HOMEPAGE = "http://github.com/jpoz/apns"
SUMMARY = "Simple Apple push notification service gem"

gemspec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["MIT-LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.authors = AUTHORS
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.require_path = 'lib'
  s.autorequire = GEM
  s.files = %w(MIT-LICENSE README.textile Rakefile) + Dir.glob("{lib}/**/*")
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

Gem::PackageTask.new(gemspec) do |pkg|
end

desc "install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end
