# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'fileutils'

module Zlown
  class Core
    APP_DIR = File.expand_path('~/.zlown')
    APP_BINARY = File.expand_path('../../../../bin/zlown', __FILE__)

    DATA_DIR = File.join(APP_DIR, 'data')
    RUN_DIR = File.join(APP_DIR, 'run')

    SERVICE_TEMPLATE = File.expand_path('../../../../etc/systemd/system/zlown.service', __FILE__)
    SERVICE_FILE = File.expand_path("#{APP_DIR}/zlown.service")

    RUN_CMD = "#{APP_BINARY} run"

    def self.install(args = [], opts = {})
      cmd = 'apt-get install -y hostapd dnsmasq wireless-tools iw wvdial'
      puts cmd
      system cmd
    end

    def self.init(args = [], opts = {})
      unless File.directory?(APP_DIR)
        puts "Creating directory #{APP_DIR}"
        FileUtils.mkdir_p(APP_DIR)
      end

      unless File.directory?(DATA_DIR)
        puts "Creating directory #{DATA_DIR}"
        FileUtils.mkdir_p(DATA_DIR)
      end

      unless File.directory?(RUN_DIR)
        puts "Creating directory #{RUN_DIR}"
        FileUtils.mkdir_p(RUN_DIR)
      end

      template = File.read(SERVICE_TEMPLATE)
      content = template.gsub('#{RUN_CMD}', RUN_CMD)

      # To write changes to the file, use:
      File.open(SERVICE_FILE, 'w') do |file|
        puts "Writting file #{SERVICE_FILE}"
        file.puts content
      end

      # See https://www.offensive-security.com/kali-linux/kali-linux-evil-wireless-access-point/
      cmd = "sed -i 's#^DAEMON_CONF=.*#DAEMON_CONF=/etc/hostapd/hostapd.conf#' /etc/init.d/hostapd"
      puts cmd
      system cmd
    end
  end
end
