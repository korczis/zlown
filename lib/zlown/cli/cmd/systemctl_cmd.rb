require_relative '../shared'

require_relative '../../systemctl/systemctl'

module Zlown::CLI
  desc 'Manage systemctl'
  command 'systemctl' do |c|
    c.desc 'Enable systemctl service'
    c.command 'enable' do |cmd|
      cmd.action do |global_options, options, args|
        Zlown::Systemctl.enable(args, options)
      end
    end
 
    c.desc 'Disable systemctl service'
    c.command 'disable' do |cmd|
      cmd.action do |global_options, options, args|
        Zlown::Systemctl.disable(args, options)
      end
    end

    c.desc 'Start systemctl service'
    c.command 'start' do |cmd|
      cmd.action do |global_options, options, args|
        Zlown::Systemctl.start(args, options)
      end
    end

    c.desc 'Stop systemctl service'
    c.command 'stop' do |cmd|
      cmd.action do |global_options, options, args|
        Zlown::Systemctl.stop(args, options)
      end
    end

    c.desc 'Status of systemctl service'
    c.command 'status' do |cmd|
      cmd.action do |global_options, options, args|
        Zlown::Systemctl.status(args, options)
      end
    end

    c.desc 'Log of systemctl service'
    c.command 'log' do |cmd|
      cmd.action do |global_options, options, args|
        Zlown::Systemctl.log(args, options)
      end
    end
  end
end
