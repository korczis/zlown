#! /usr/bin/env bash

IFACE_AP=wlan1
IFACE_UPSTREAM=eth1

iptables -t nat -F
iptables -F
iptables -t nat -A POSTROUTING -o ${IFACE_UPSTREAM} -j MASQUERADE
iptables -A FORWARD -i ${IFACE_AP} -o ${IFACE_UPSTREAM} -j ACCEPT

echo '1' > /proc/sys/net/ipv4/ip_forward
