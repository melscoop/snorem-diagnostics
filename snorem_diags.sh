#!/bin/bash

# Welcome message
echo -e "Zzzz... Hello there. I'm a sleepy sloth, but I'll try to help you with your system diagnostics. Zzzz...\n"
echo ""

# Display system information
echo "System Information:"
echo "--------------------"
hostnamectl
echo ""

# Display system throughput IOPs

echo "System throughput IOPS:"
iostat -d -x 1 3
echo ""

# Display CPU load

echo "CPU Load:"
htop -n 1 -p $(pgrep -d',' -x -n -v htop)
echo ""

# Display system load
echo "System Load:"
echo "-------------"
uptime
echo ""

# Display memory usage
echo "Memory Usage:"
echo "-------------"
free -h
echo ""

# Display and rogue processes

echo "Rogue Processes:"
htop
echo ""

# Display disk usage
echo "Disk Usage:"
echo "-----------"
df -h
echo ""

# Display network information
echo "Network Information:"
echo "--------------------"
ip a
echo ""

# Display process information
echo "Process Information:"
echo "--------------------"
ps auxf
echo ""

# Goodbye message
echo -e "Zzzz... That's all folks. Time to go back to sleep. Zzzz...\n"
