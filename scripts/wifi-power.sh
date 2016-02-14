#! /usr/bin/env bash

IFACE=wlan1

iw reg set BO
iwconfig $IFACE txpower 30

