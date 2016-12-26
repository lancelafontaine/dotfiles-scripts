#!/usr/bin/env bash
WIFIICON=""
DISCONNECTEDICON=""
ISCONNECTED="$(nmcli -terse -colors no -fields STATE general)"
CONNECTIONNAME="$(nmcli -terse -fields NAME connection show --active)"
LINKQUALITY="$(iwconfig | egrep -o '[0-9]*/70')"

if [ ! "$ISCONNECTED" == "connected" ]; then
  echo "$DISCONNECTEDICON"
else
  echo "$WIFIICON $CONNECTIONNAME $LINKQUALITY"
fi


