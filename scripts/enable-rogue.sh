#! /usr/bin/env bash

IF_WIFI=wlan1
IF_LTE=eth1

iptables -t nat -F
iptables -F
iptables -t nat -A POSTROUTING -o ${IF_LTE} -j MASQUERADE
iptables -A FORWARD -i ${IF_WIFI} -o ${IF_LTE} -j ACCEPT

# echo '1' > /proc/sys/net/ipv4/ip_forward

