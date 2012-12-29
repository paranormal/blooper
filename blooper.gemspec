# encoding: utf-8
require File.expand_path("../lib/blooper/version", __FILE__)

Gem::Specification.new do |s|
  s.name               = 'blooper'
  s.version            = Blooper::VERSION
  s.platform           = Gem::Platform::RUBY
  s.authors            = ['paranormal']
  s.email              = %q{mbsd@isgroup.com.ua}
  s.homepage           = 'https://github.com/paranormal/blooper'
  s.summary            = %q{squid's access log collector — Read more}
  s.description        = %q{work through squid access log daemon}
  s.default_executable = 'blooper'
  s.license            = 'bsd'

  s.required_rubygems_version = '>= 1.3.6'
  s.required_ruby_version     = '>= 1.9.0'
  s.rubygems_version = %q{1.8.24}
  s.add_development_dependency 'rspec', '~> 2.0'

  s.date = %q{2012-12-01}
  s.files = %w'bin/blooper lib/blooper.rb lib/blooper/input.rb
              lib/blooper/line.rb lib/blooper/rows.rb
              lib/blooper/db.rb lib/blooper/version.rb
              COPYING README.rdoc'
  s.require_paths      = ['lib']
  s.executables        = %q(blooper)

  s.add_dependency('pg', '>=  0.14.0')
  s.add_dependency('sequel', '>=  3.38.0')
  s.add_development_dependency('rspec')

end
