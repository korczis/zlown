# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'fileutils'

module Zlown
  class Core
    APP_DIR = File.expand_path('~/.zlown')
    APP_BINARY = File.expand_path('../../../../bin/zlown')

    SERVICE_TEMPLATE = File.expand_path('../../../../etc/systemd/system/zlown.service', __FILE__)
    SERVICE_FILE = File.expand_path("#{APP_DIR}/zlown.service")

    RUN_CMD = "#{APP_BINARY} run"

    def self.init(args = [], opts = {})
      unless File.directory?(APP_DIR)
        FileUtils.mkdir_p(APP_DIR)
      end

      template = File.read(SERVICE_TEMPLATE)
      content = template.gsub('#{RUN_CMD}', RUN_CMD)

      # To write changes to the file, use:
      File.open(SERVICE_FILE, 'w') do |file|
        file.puts content
      end
    end
  end
end
