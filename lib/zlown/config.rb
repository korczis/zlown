# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

module Zlown
  module Config
    APP_DIR = File.expand_path('~/.zlown')
    APP_BINARY = File.expand_path('../../../../bin/zlown', __FILE__)

    CONFIG_FILE = File.join(APP_DIR, 'zlown.yml')

    DATA_DIR = File.join(APP_DIR, 'data')
    RUN_DIR = File.join(APP_DIR, 'run')

    SERVICE_TEMPLATE = File.expand_path('../../../../etc/systemd/system/zlown.service', __FILE__)
    SERVICE_FILE = File.expand_path("#{APP_DIR}/zlown.service")

    RUN_CMD = "#{APP_BINARY} run"

    DNSMASQ_SERVICE = 'dnsmasq.service'
    HOSTAPD_SERVICE = 'hostapd.service'
  end
end
