task :gem do
  spec = File.read('blooper.gemspec')
  Gem::Builder.new(instance_eval(spec)).build
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task default: :spec
