#!/bin/bash

source ./get_info.sh
source ./save_to_file.sh

HOSTNAME=$(get_hostname)
TIMEZONE=$(get_timezone)
USER=$(get_user)
OS=$(get_os)
DATE=$(get_date)
UPTIME=$(get_uptime)
UPTIME_SEC=$(get_uptime_sec)
IP=$(get_ip)
MASK=$(get_mask)
GATEWAY=$(get_gateway)
RAM_TOTAL=$(get_ram_total)
RAM_USED=$(get_ram_used)
RAM_FREE=$(get_ram_free)
SPACE_ROOT=$(get_space_root)
SPACE_ROOT_USED=$(get_space_root_used)
SPACE_ROOT_FREE=$(get_space_root_free)

echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $TIMEZONE" 
echo "USER = $USER" 
echo "OS = $OS" 
echo "DATE = $DATE" 
echo "UPTIME = $UPTIME" 
echo "UPTIME_SEC = $UPTIME_SEC" 
echo "IP = $IP" 
echo "MASK = $MASK" 
echo "GATEWAY = $GATEWAY" 
echo "RAM_TOTAL = $RAM_TOTAL Gb" 
echo "RAM_USED = $RAM_USED Gb" 
echo "RAM_FREE = $RAM_FREE Gb" 
echo "SPACE_ROOT = $SPACE_ROOT Mb" 
echo "SPACE_ROOT_USED = $SPACE_ROOT_USED Mb" 
echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE Mb" 

ask_to_save


