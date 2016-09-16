#!/usr/bin/env python3

import subprocess

xbacklight = subprocess.Popen("xbacklight -get", stdout=subprocess.PIPE, shell=True)
(xbacklightOutput, err) = xbacklight.communicate()
# Substring of 5 chars, enough to properly convert to float, then to int.
backlightPercent = int(float(xbacklightOutput.decode('utf-8')[0:5]))

icon = ""
print(icon + " " + str(backlightPercent) + "%")
