require_relative '../shared'

require_relative '../../daemon/daemon'

module Zlown::CLI
  desc 'Manage systemctl'
  command 'systemctl' do |c|
    c.desc 'Enable systemctl service'
    c.command 'enable' do |cmd|
      cmd.action do |global_options, options, args|
        puts "Enabling systemctl service"
      end
    end
 
    c.desc 'Disable systemctl service'
    c.command 'disable' do |cmd|
      cmd.action do |global_options, options, args|
        puts "Disabling systemctl service"
      end
    end

    c.desc 'Start systemctl service'
    c.command 'start' do |cmd|
      cmd.action do |global_options, options, args|
        puts "Starting systemctl service"
      end
    end

    c.desc 'Stop systemctl service'
    c.command 'stop' do |cmd|
      cmd.action do |global_options, options, args|
        puts "Stopping systemctl service"
      end
    end
  end
end
