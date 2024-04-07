#!/bin/bash

# Some Network Diagnostic or Check Commands
echo "Checking System Date/Time Info"

timedatectl

# Ping www.spectrum.net 
echo "============================================================="
ping -c 4 192.168.1.1
echo "============================================================="

# Checking NSLOOKUP and DIG
echo "============================================================="
nslookup www.spectrum.net
echo "============================================================="

# checking DIG command 
echo "============================================================="
dig www.spectrum.net
echo "============================================================="

# Checking network information
nmcli general

echo "============================================================="
nmcli netrowrking

echo "============================================================="
nmcli radio

echo "============================================================="
nmcli connection

echo "============================================================="
# Checking NETSTAT routes
netstat -r

# Checking NETSTAT interfaces
netstat -i

# Checking NETSTAT Groups
netstat -g

echo "============================================================="
# Checking NETSTAT Listening Server 

echo "Active UNIX Domain Sockets are: "
netstat -l | wc -l


