require_relative '../shared'

require_relative '../../core/core'

module Zlown::CLI
  desc 'Init Daemon'
  command 'init' do |c|
    c.action do |global_options, options, args|
      Zlown::Core.init(args, options)
    end
  end
end
