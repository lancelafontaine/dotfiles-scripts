#!/usr/bin/env sh

function refreshwallpaper {
  feh --randomize --bg-fill ~/Pictures/Wallpapers/*
}

if (xrandr | tr -d "[:space:]" | egrep "DP2connected.*HDMI1connected" > /dev/null)
then
  xrandr \
    --output VIRTUAL1 --off \
    --output eDP1 --off \
    --output DP1 --off \
    --output HDMI2 --off \
    --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DP2 --mode 1920x1080 --pos 1920x0 --rotate normal;
  refreshwallpaper
else
  xrandr \
    --output VIRTUAL1 --off \
    --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DP1 --off \
    --output HDMI2 --off \
    --output HDMI1 --off \
    --output DP2 --off;
  refreshwallpaper
fi
