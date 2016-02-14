#! /usr/bin/env bash

ngrep -q -d wlan1 -W byline port 80 > /root/data/ngrep.log

