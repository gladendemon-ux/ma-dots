#!/bin/bash

R1=$(awk '{s+=$1} END {print s}' /sys/class/net/[ew]*/statistics/rx_bytes)
sleep 1
R2=$(awk '{s+=$1} END {print s}' /sys/class/net/[ew]*/statistics/rx_bytes)

DIFF=$((R2 - R1))

# convert to KB/s (integer)
KBPS=$((DIFF / 1024))

if [ $KBPS -ge 1024 ]; then
    # calculate MB/s as float
    MBPS=$(awk -v k="$KBPS" 'BEGIN {print k/1024}')
    
    # show decimal if < 10 MB/s, otherwise integer
    if (( $(awk -v m="$MBPS" 'BEGIN {print (m<10)}') )); then
        printf "%.1f MB/s\n" "$MBPS"
    else
        printf "%.0f MB/s\n" "$MBPS"
    fi
else
    echo "$KBPS KB/s"
fi
