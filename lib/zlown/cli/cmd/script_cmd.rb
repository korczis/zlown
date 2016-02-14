require_relative '../shared'

require_relative '../../script/script'

module Zlown::CLI
  desc 'Controll scripts'
  command 'script' do |c|
    c.action do |global_options, options, args|
      c.desc 'Run script'
      c.command 'run' do |cmd|
        cmd.action do |global_options, options, args|
          Zlown::Script.run(args, options)
        end
      end
    end
  end
end
