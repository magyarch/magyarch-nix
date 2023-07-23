#!/bin/sh

# Get the CPU frequency in MHz
cpu_freq=$(cat /proc/cpuinfo | grep MHz | awk '{sum+=$4} END {printf "%.2f", sum/NR}')

# Print the CPU frequency
echo "FREQ: ${cpu_freq} MHz"

