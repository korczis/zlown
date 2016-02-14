require_relative '../shared'

require_relative '../../script/script'

module Zlown::CLI
  desc 'Manage scripts'
  command 'script' do |c|
    c.desc 'Manage httpry'
    c.command 'httpry' do |cmd|
      cmd.desc 'Start httpry'
      cmd.command 'start' do |script_cmd|
        script_cmd.action do |global_options, options, args|
          Zlown::Script.httpry_start(args, options)
        end
      end

      cmd.desc 'Stop httpry'
      cmd.command 'start' do |script_cmd|
        script_cmd.action do |global_options, options, args|
          Zlown::Script.httpry_stop(args, options)
        end
      end
    end
  end
end
