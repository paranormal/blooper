task default: :spec

task :gem do
  spec = File.read('blooper.gemspec')
  Gem::Builder.new(instance_eval(spec)).build
end

task :spec do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new('spec') do |t|
    t.ruby_opts = %w[-w]
  end
end
