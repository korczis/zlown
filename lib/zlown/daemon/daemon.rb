# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

module Zlown
  class Daemon
    def run(args = [], opts = {})
      puts "Running Zlown loop"
      STDOUT.flush

      while true
        sleep 1
      end
    end
  end
end

