# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

module Zlown
  class Systemctl
    SERVICE_FILE = File.expand_path('~/.zlown/zlown.service')
    SERVICE_NAME = 'zlown'

    def self.enable(args = [], opts = {})
      puts 'Enabling systemctl service'
      cmd = "systemctl enable #{SERVICE_FILE}"
      puts cmd
      system cmd
    end

    def self.disable(args = [], opts = {})
      puts 'Disabling systemctl service'
      cmd = "systemctl disable #{SERVICE_NAME}"
      system cmd
    end

    def self.start(args = [], opts = {})
      puts 'Starting systemctl service'
      cmd = "systemctl start #{SERVICE_NAME}"
      system cmd
    end

    def self.stop(args = [], opts = {})
      puts 'Stopping systemctl service'
      cmd = "systemctl stop #{SERVICE_NAME}"
      system cmd
    end

    def self.status(args = [], opts = {})
      cmd = "systemctl status #{SERVICE_NAME}"
      system cmd
    end

    def self.log(args = [], opts = {})
      cmd = "journalctl -u #{SERVICE_NAME}"
      system cmd
    end
  end
end

