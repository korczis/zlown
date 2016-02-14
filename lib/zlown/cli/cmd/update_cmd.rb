require_relative '../shared'

require_relative '../../core/core'

module Zlown::CLI
  desc 'Update all required scripts based on config'
  command 'update' do |c|
    c.action do |global_options, options, args|
      Core.update_configs(args, options)
    end
  end
end
