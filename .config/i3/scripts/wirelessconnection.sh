#!/usr/bin/env bash
WIFIICON=""
DISCONNECTEDICON=""
ISCONNECTED="$(nmcli -terse -colors no -fields STATE general)"
CONNECTIONNAME="$(nmcli -terse -fields NAME connection show --active)"

if [ ! "$ISCONNECTED" == "connected" ]; then
  echo "$DISCONNECTEDICON"
else
  echo "$WIFIICON $CONNECTIONNAME"
fi


