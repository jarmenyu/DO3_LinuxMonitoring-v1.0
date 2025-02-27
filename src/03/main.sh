#!/bin/bash

source ./get_info.sh
source ./colors.sh

get_new_params() {
    echo "enter new parameters"
    read p1 p2 p3 p4
}

while true; do
    p1=$1
    p2=$2
    p3=$3
    p4=$4
    if [ $# -ne 4 ]; then
        echo "Enter only 4 parameters"
        exit 1
    fi

    for param in "$@"; do
        if [[ ! "$param" =~ ^[1-6]$ ]]; then
            echo "Every parameters must be number in range from 1 to 6"
            exit 1
        fi
    done

    if [[ "$1" -eq "$2" || "$3" -eq "$4" ]]; then
        echo "Error: 1 и 2 параметр должны отличаться, 3 и 4 соответственно"
        get_new_params
    fi

    bg_name=${bg[$p1]}
    fc_name=${colors[$p2]}
    bg_value=${bg[$p3]}
    fc_value=${colors[$p4]}

    break
done

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

print() {
    local label=$1
    local value=$2
    echo -e "${bg_name}${fc_name} $label ${reset_color} = ${bg_value}${fc_value} $value ${reset_color}"
}

print "HOSTNAME" "$HOSTNAME"
print "TIMEZONE" "$TIMEZONE" 
print "USER" "$USER" 
print "OS" "$OS" 
print "DATE" "$DATE" 
print "UPTIME" "$UPTIME" 
print "UPTIME_SEC" "$UPTIME_SEC" 
print "IP" "$IP" 
print "MASK" "$MASK" 
print "GATEWAY" "$GATEWAY" 
print "RAM_TOTAL" "$RAM_TOTAL Gb" 
print "RAM_USED" "$RAM_USED Gb" 
print "RAM_FREE" "$RAM_FREE Gb" 
print "SPACE_ROOT" "$SPACE_ROOT Mb" 
print "SPACE_ROOT_USED" "$SPACE_ROOT_USED Mb" 
print "SPACE_ROOT_FREE" "$SPACE_ROOT_FREE Mb" 