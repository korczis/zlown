# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require_relative '../config'

module Zlown
  class Script
    def self.httpry_start(args = [], opts = {})
      cmd = "httpry -d -P #{Zlown::Config::HTTPRY_PID_FILE} -i wlan1 -o /root/.zlown/data/httpry.log -b /root/.zlown/data/httpry.bin"
      puts cmd
      system cmd
    end

    def self.httpry_stop(args = [], opts = {})
      pid = File.open(Zlown::Config::HTTPRY_PID_FILE).read.to_i
      cmd = "kill #{pid}"
      puts cmd
      system cmd
    end
  end
end
