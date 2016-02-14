require_relative '../shared'

require_relative '../../daemon/daemon'

module Zlown::CLI
  desc 'Run Daemon'
  command 'run' do |c|
    c.action do |global_options, options, args|
      daemon = Zlown::Daemon.new
      daemon.run(args, options)
    end
  end
end
