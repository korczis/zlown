# zlown

Rogue Access Point

## Required HW

- [LTE Modem](http://www.ebay.de/itm/221999423422?_trksid=p2060353.m2749.l2649&ssPageName=STRK%3AMEBIDX%3AIT)
- [WiFi Dongle](http://www.amazon.de/Alfa-AWUS036NHV-802-11b-Langfris-Adapter/dp/B00LLBQP9M/ref=sr_1_fkmr0_1?ie=UTF8&qid=1455555587&sr=8-1-fkmr0&keywords=Alfa+AWUSO36NH+High+Gain+USB+Wireless+G+%2F+N+Long-Rang+WiFi+Network+Adapter)
- [Powerbank](http://www.amazon.co.uk/gp/product/B012V9H3WA?psc=1&redirect=true&ref_=oh_aui_detailpage_o00_s00) (optional; if you want to be truly mobile)

## Prerequisites

- apt-get (developed using [Kali Linux](https://www.kali.org/))
- systemd
- dnsmasq
- hostapd
- ruby
- rubygems
- bundler

## How To

- `git clone https://github.com/korczis/zlown.git`
- `bundle`
- `./bin/zlown install`
- `./bin/zlown init`
- `./bin/zlown enable`
- `./bin/zlown start`
