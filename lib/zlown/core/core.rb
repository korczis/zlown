# encoding: UTF-8
#
# Copyright (c) 2016 Tomas Korcak <korczis@gmail.com>. All rights reserved.
# This source code is licensed under the MIT-style license found in the
# LICENSE file in the root directory of this source tree.

require 'FileUtils'

module Zlown
  class Core
    APP_DIR = File.expand_path('~/.zlown')

    def self.init(args = [], opts = {})
      unless File.directory?(APP_DIR)
        FileUtils.mkdir_p(APP_DIR)
      end
    end
  end
end
