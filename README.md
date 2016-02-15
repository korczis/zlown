# zlown

Rogue and Evil Access Point

## Status

[![Gem Version](https://badge.fury.io/rb/zlown.png)](http://badge.fury.io/rb/zlown)
[![Downloads](http://img.shields.io/gem/dt/zlown.svg)](http://rubygems.org/gems/zlown)

## Features implemented

- Intuitive CLI
- Configurable (~/.zlown/zlown.yml)
- Connects to internet using LTE
- Shares connectivity over WiFi
- Logs all HTTP trafic

## Features planned

- HTTPS sniffing of non-HSTS sites (sslsniff, sslstrip, sslsplit)
- ARP spoofing
- DNS spoofing
- Evil Twin WiFi
- Auto terminate (RST) connections based on criteria specified (pcap filter)
- On-the-fly trafic modification
- Fake updates
- REST API
- Web GUI

## Required HW

- [Raspberry Pi 2](http://www.amazon.de/Raspberry-Pi-quad-core-Cortex-A7-compatibility/dp/B00T2U7R7I/ref=sr_1_1?s=ce-de&ie=UTF8&qid=1455555744&sr=1-1&keywords=rpi2)
- [LTE Modem](http://www.ebay.de/itm/221999423422?_trksid=p2060353.m2749.l2649&ssPageName=STRK%3AMEBIDX%3AIT)
- [WiFi Dongle](http://www.amazon.de/Alfa-AWUS036NHV-802-11b-Langfris-Adapter/dp/B00LLBQP9M/ref=sr_1_fkmr0_1?ie=UTF8&qid=1455555587&sr=8-1-fkmr0&keywords=Alfa+AWUSO36NH+High+Gain+USB+Wireless+G+%2F+N+Long-Rang+WiFi+Network+Adapter)
- [Powerbank](http://www.amazon.co.uk/gp/product/B012V9H3WA?psc=1&redirect=true&ref_=oh_aui_detailpage_o00_s00) (optional; if you want to be truly mobile)

## Prerequisites

## Core

These are must to have.

- apt-get (developed using [Kali Linux](https://www.kali.org/))
- systemd
- ruby
- rubygems
- bundler

## Nice to have

These will be installed during `zlown install` if not present.

- dnsmasq
- hostapd

## Optional

Presence of these tools affects which features will be available.

- httpry
- ngrep
- sslsniff, sslstrip, sslsplit

## Installation

- `gem install zlown`
- `zlown install`
- `zlown init`
- `zlown enable`
- `zlown start`

***OR***

- `git clone https://github.com/korczis/zlown.git`
- `cd zlown`
- `bundle`
- `./bin/zlown install`
- `./bin/zlown init`
- `./bin/zlown enable`
- `./bin/zlown start`

## Details

- zlown main entrypoint is zlown systemd service
  - run `zlown systemctl status` or `systemctl status zlown` to obtain info about running zlown service
  - run `zlown systemctl log` or `journlctl -u zlown` to see complete zlown service log
- All zlown related stuff is in ~/.zlown folder
- Main config is stored in ~/.zlown/zlown.yml
- All captured data are stored in ~/.zlown/data

