#!/bin/sh

# Store the output of upower command
power_now=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)

# Extract relevant information using grep and awk
state=$(echo "$power_now" | grep -i "state" | awk '{print $2}')

percentage=$(echo "$power_now" | grep -i "percentage" | awk '{print $2}')

time=$(echo "$power_now" | grep -i "time to empty" | awk '{print $4, $5}')

if [ $state = "discharging" ]; then
    total_message="CS: $state, BL: $percentage, TL: $time"
else
    total_message="CS: $state, BL: $percentage"
fi

# Print the extracted information
echo $total_message
