#!/bin/bash

# Welcome message
echo -e "Zzzz... Hello there. I'm a sleepy sloth, but I'll try to help you with your system diagnostics. Zzzz...\n"
echo ""

# Display system information
echo "System Information:"
echo "--------------------"
hostnamectl
echo ""

# Display CPU load

echo "CPU Load over the next 30 seconds:"
for i in {1..6}; do top -bn 1 | grep "^%Cpu" && sleep 5; done
echo ""

# Display processes using more than 60% of CPU

echo "Processes using more than 60% of CPU"
echo "--------------------"
ps aux --sort=-%cpu | awk '{if ($3 > 60.0) print $0}'
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
ps aux | awk '$1!="root"&&$1!="USER"&&$3>=50 { print $0 }'
echo ""

# Display disk usage
echo "Disk Usage:"
echo "-----------"
df -h
echo ""

# Display network information
echo "Basic Network Information:"
echo "--------------------"
ip a
echo ""

# Display system throughput IOPs

echo "System throughput IOPS over 30 seconds:"
echo "This test will post the IOPs taken every ten seconds over a thirty second duration..."
iostat -d -m -t -y -N 10 3
echo ""

# Goodbye message
echo -e "Zzzz... That's all folks. Time to go back to sleep. Zzzz...\n"
