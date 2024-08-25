#!/bin/bash

INTERFACE="enX0"  # actual network interface

#Function to monitor the top 10 most used applications (CPU and memory)
monitor_top_apps() {
    echo "--------------------------------"
    echo "Top 10 Applications by CPU and Memory Usage"
    echo "--------------------------------"
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 11
}

monitor network
monitor_network() {
    echo "--------------------------------"
    echo "Network Monitoring"
    echo "--------------------------------"

    # Concurrent Connections
    echo "Concurrent Connections:"
    if command -v ss > /dev/null; then
        ss -H state ESTABLISHED | wc -l
    else
        echo "ss command not found. Please install iproute2."
    fi
    echo ""

    # Packet Drops
    echo "Packet Drops:"
