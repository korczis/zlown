# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

module Zlown
  class Script
    def self.httpry(args = [], opts = {})
      cmd = 'httpry -d -P /root/.zlown/run/httpry.pid -i wlan1 -o /root/.zlown/data/httpry.log -b /root/.zlown/data/httpry.bin'
      puts cmd
      system cmd
    end
  end
end
