require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task default: :spec
rescue LoadError
  puts 'rspec not installed, skipping ...'
end

desc 'Run Rubocop'
task :cop do
  exec 'rubocop -D lib/ goodot.gemspec Rakefile'
end

