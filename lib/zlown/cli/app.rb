# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'gli'
require 'pathname'
require 'pp'

require_relative 'shared'
require_relative '../version'

module Zlown::CLI
  include GLI::App
  extend self

  def self.launch(args)
    exit run ARGV
  end

  program_desc 'Rogue Access Point'
end

cmds = File.absolute_path(File.join(File.dirname(__FILE__), 'cmd'))
Dir.glob(cmds + '/*.rb').each do |file|
  require file
end

Zlown::CLI.launch(ARGV)

