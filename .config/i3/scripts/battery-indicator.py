#!/usr/bin/env python3

import subprocess
import re

acpi = subprocess.Popen("acpi", stdout=subprocess.PIPE, shell=True)
(acpiOutput, err) = acpi.communicate()

# Group 1 is the word 'Discharging' or 'Charging'
# Group 2 is the percentage of battery remaining (2-3 chars)
match = re.search(r'Battery 0: (Discharging|Charging),\s(\d{1,3})%.*', acpiOutput.decode("utf-8"))

if match:
    if match.group(1) == "Discharging":
        spacing = "  "
        if int(match.group(2)) > 87:
            icon = ""
        elif int(match.group(2)) > 62:
            icon = ""
        elif int(match.group(2)) > 32:
            icon = ""
        elif int(match.group(2)) > 10:
            icon = ""
        elif int(match.group(2)) <= 10:
            icon = " "
        else:
            icon = ""
    elif match.group(1) == "Charging":
        icon = ""
        spacing = " "
    else:
        icon = ""
        
    print(icon + spacing + match.group(2) + "%")
else:
    print("Cannot detect battery info")
