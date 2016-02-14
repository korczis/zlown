# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'gli'
require 'pathname'

require_relative '../version'

module Zlown::CLI
  # include 
  extend GLI::App

  desc 'Verbose mode'
  arg_name 'verbose'
  switch [:v, :verbose]

  pre do |global_options,command,options,args|
    true
  end
end
