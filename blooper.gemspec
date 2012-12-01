Gem::Specification.new do |s|
  s.name               = 'blooper'
  s.version            = '1'
  s.default_executable = 'blooper'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to?(:required_rubygems_version=)
  s.authors = ['paranormal']
  s.date = %q{2012-12-01}
  s.description = %q{squid's access log collector}
  s.email = %q{mbsd@isgroup.com.ua}
  s.files = %w{bin/blooper.rb lib/database.rb lib/input.rb lib/line.rb
               lib/rows.rb model/access.rb}
  s.test_files = %w{spec/database.rb spec/line.rb spec/spec_helper.rb}
  s.homepage = %q{http://rubygems.org/gems/hola}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.8.24}
  s.summary = %q{Blooper}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

