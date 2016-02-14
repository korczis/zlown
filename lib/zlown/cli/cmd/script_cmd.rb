require_relative '../shared'

require_relative '../../script/script'

module Zlown::CLI
  desc 'Manage scripts'
  command 'script' do |c|
    c.desc 'Run httpry'
    c.command 'httpry' do |cmd|
      cmd.action do |global_options, options, args|
       Zlown::Script.httpry(args, options)
      end
    end
  end
end
