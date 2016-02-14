# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'fileutils'
require 'highline'
require 'yaml'

require_relative '../config'

module Zlown
  class Core
    def self.load_config(args = [], opts = {})
      config = {
        upstream: 'eth0',
        ap: 'wlan0',
        driver: 'nl80211',
        ssid: 'FreeWifi',
        channel: '6'
      }

      if File.exist?(Zlown::Config::CONFIG_FILE)
        config = config.merge(YAML.load(File.open(Zlown::Config::CONFIG_FILE)))
      end
    end

    def self.install(args = [], opts = {})
      cmd = 'apt-get install -y hostapd dnsmasq wireless-tools iw wvdial'
      puts cmd
      system cmd
    end

    def self.init_dirs(args = [], opts = {})
      unless File.directory?(Zlown::Config::APP_DIR)
        puts "Creating directory #{Zlown::Config::APP_DIR}"
        FileUtils.mkdir_p(Zlown::Config::APP_DIR)
      end

      unless File.directory?(Zlown::Config::DATA_DIR)
        puts "Creating directory #{Zlown::Config::DATA_DIR}"
        FileUtils.mkdir_p(Zlown::Config::DATA_DIR)
      end

      unless File.directory?(Zlown::Config::RUN_DIR)
        puts "Creating directory #{Zlown::Config::RUN_DIR}"
        FileUtils.mkdir_p(Zlown::Config::RUN_DIR)
      end
    end

    def self.init_service_template(args = [], opts = {})
      template = File.read(Zlown::Config::SERVICE_TEMPLATE)
      content = template.gsub('#{RUN_CMD}', Zlown::Config::RUN_CMD)

      # To write changes to the file, use:
      File.open(Zlown::Config::SERVICE_FILE, 'w') do |file|
        puts "Writting file #{Zlown::Config::SERVICE_FILE}"
        file.puts content
      end
    end

    def self.init_config_file(args = [], opts = {})
      config = Core.load_config(args, opts)

      cli = HighLine.new
      config[:upstream] = cli.ask('Upstream Interface?') { |q| q.default = config[:upstream] }
      config[:ap] = cli.ask('Wi-Fi ap Interface?') { |q| q.default = config[:ap] }
      config[:driver] = cli.ask('Wi-Fi Driver?') { |q| q.default = config[:driver] }
      config[:ssid] = cli.ask('Wi-Fi SSID?') { |q| q.default = config[:ssid] }
      config[:channel] = cli.ask('Wi-Fi Channel?') { |q| q.default = config[:channel] }

      puts "Writting config to #{Zlown::Config::CONFIG_FILE}"
      File.open(Zlown::Config::CONFIG_FILE, 'w') do |f|
        f.write config.to_yaml
      end

      config
    end

    def self.init_systemctl(args = [], opts = {})
      # TODO: Process dnsmasq.conf and hostapd.conf

      cmd = "systemctl enable #{Zlown::Config::HOSTAPD_SERVICE}"
      puts cmd
      system cmd

      cmd = "systemctl enable #{Zlown::Config::DNSMASQ_SERVICE}"
      puts cmd
      system cmd

      cmd = "systemctl start #{Zlown::Config::HOSTAPD_SERVICE}"
      puts cmd
      system cmd

      cmd = "systemctl start #{Zlown::Config::DNSMASQ_SERVICE}"
      puts cmd
      system cmd
    end

    def self.init_dnsmaq(args = [], opts = {})
      config = Core.load_config(args, opts)

      template = File.read(Zlown::Config::DNSMASQ_TEMPLATE)
      content = template.gsub('#{IFACE_AP}', config[:ap])

      # To write changes to the file, use:
      File.open(Zlown::Config::DNSMASQ_CONFIG, 'w') do |file|
        puts "Writting file #{Zlown::Config::DNSMASQ_CONFIG}"
        file.puts content
      end
    end

    def self.init_hostapd(args = [], opts = {})
      # See https://www.offensive-security.com/kali-linux/kali-linux-evil-wireless-access-point/
      cmd = "sed -i 's#^DAEMON_CONF=.*#DAEMON_CONF=/etc/hostapd/hostapd.conf#' /etc/init.d/hostapd"
      puts cmd
      system cmd

      config = Core.load_config(args, opts)

      template = File.read(Zlown::Config::HOSTAPD_TEMPLATE)
      content = template
                  .gsub('#{IFACE}', config[:ap])
                  .gsub('#{DRIVER}', config[:driver])
                  .gsub('#{SSID}', config[:ssid])
                  .gsub('#{CHANNEL}', config[:channel])

      # To write changes to the file, use:
      File.open(Zlown::Config::HOSTAPD_CONFIG, 'w') do |file|
        puts "Writting file #{Zlown::Config::HOSTAPD_CONFIG}"
        file.puts content
      end
    end

    def self.init_boot_script(args = [], opts = {})
      config = Core.load_config(args, opts)

      template = File.read(Zlown::Config::BOOT_SCRIPT_TEMPLATE)
      content = template
                  .gsub('#{IFACE}', config[:ap])
                  .gsub('#{DRIVER}', config[:driver])
                  .gsub('#{SSID}', config[:ssid])
                  .gsub('#{CHANNEL}', config[:channel])

      # To write changes to the file, use:
      File.open(Zlown::Config::BOOT_SCRIPT, 'w') do |file|
        puts "Writting file #{Zlown::Config::BOOT_SCRIPT}"
        file.puts content
      end
    end

    def self.init_rc_local(args = [], opts = {})
      Core.init_boot_script(args, opts)

      config = Core.load_config(args, opts)

      template = File.read(Zlown::Config::RCLOCAL_TEMPLATE)
      # To write changes to the file, use:
      File.open(Zlown::Config::RCLOCAL_CONFIG, 'w') do |file|
        puts "Writting file #{Zlown::Config::RCLOCAL_CONFIG}"
        file.puts content
      end
    end

    def self.update_configs(args = [], opts = {})
      Core.init_dnsmaq(args, opts)

      Core.init_hostapd(args, opts)

      Core.init_rc_local(args, opts)

      Core.init_systemctl(args, opts)
    end

    def self.init(args = [], opts = {})
      Core.init_dirs(args, opts)

      Core.init_service_template(args, opts)

      Core.init_config_file(args, opts)

      Core.update_configs(args, opts)
    end
  end
end
