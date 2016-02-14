# encoding: utf-8

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

