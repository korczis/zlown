require_relative '../shared'

require_relative '../../core/core'

module Zlown::CLI
  desc 'Install Prerequisites'
  command 'install' do |c|
    c.action do |global_options, options, args|
      Zlown::Core.install(args, options)
    end
  end
end
