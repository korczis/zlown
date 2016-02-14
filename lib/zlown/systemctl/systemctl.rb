# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require_relative '../config'

module Zlown
  class Systemctl
    def self.enable(args = [], opts = {})
      puts 'Enabling systemctl service'
      cmd = "systemctl enable #{Zlown::Config::ZLOWN_SERVICE_FILE}"
      puts cmd
      system cmd
    end

    def self.disable(args = [], opts = {})
      puts 'Disabling systemctl service'
      cmd = "systemctl disable #{Zlown::Config::ZLOWN_SERVICE_NAME}"
      system cmd
    end

    def self.start(args = [], opts = {})
      puts 'Starting systemctl service'
      cmd = "systemctl start #{Zlown::Config::ZLOWN_SERVICE_NAME}"
      system cmd
    end

    def self.stop(args = [], opts = {})
      puts 'Stopping systemctl service'
      cmd = "systemctl stop #{SERVICE_NAME}"
      system cmd
    end

    def self.status(args = [], opts = {})
      cmd = "systemctl status #{Zlown::Config::ZLOWN_SERVICE_NAME}"
      system cmd
    end

    def self.log(args = [], opts = {})
      cmd = "journalctl -u #{Zlown::Config::ZLOWN_SERVICE_NAME}"
      system cmd
    end
  end
end

