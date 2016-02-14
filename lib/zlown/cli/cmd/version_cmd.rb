# encoding: UTF-8
#
# Copyright (c) 2010-2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require_relative '../../version'
require_relative '../shared'

module Zlown::CLI
  desc 'Print version info'
  skips_pre
  command :version do |c|
    c.action do |_global_options, _options, _args|
      puts Zlown::VERSION
    end
  end
end

