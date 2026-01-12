#!/bin/bash

echo "------------------------------------------"
echo " OS VERSION & UPTIME"
sw_vers | awk -F':\t' '{print $2}' | xargs echo "OS:"
uptime
echo "------------------------------------------"

# 1. TOTAL CPU USAGE
# On Mac, 'top' is heavy. We can use 'hostinfo' or 'top -l 1'
echo "CPU Usage:"
# HINT: Look for the 'idle' percentage and subtract from 100
top -l 1 | grep "CPU usage" 

echo "------------------------------------------"

# 2. MEMORY USAGE
# macOS doesn't have the 'free' command. We use 'vm_stat' or 'top'
echo "Memory Usage:"
# HINT: Use 'top -l 1 | grep PhysMem' to get Used and Free
top -l 1 | grep "PhysMem"

echo "------------------------------------------"

# 3. DISK USAGE
echo "Disk Usage:"
# HINT: Use 'df -h'. The main drive is usually at '/'
df -h / | awk 'NR==2 {printf "Used: %s, Free: %s, Percent: %s\n", $3, $4, $5}'

echo "------------------------------------------"

# 4. TOP 5 PROCESSES BY CPU
echo "Top 5 Processes by CPU Usage:"
# HINT: -r sorts by CPU. 'head -n 6' gives header + top 5
ps -Ao user,pcpu,comm -r | head -n 6

echo "------------------------------------------"

# 5. TOP 5 PROCESSES BY MEM
echo "Top 5 Processes by Memory Usage:"
# HINT: -m sorts by Memory
ps -Ao user,pmem,comm -m | head -n 6