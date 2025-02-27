#!/bin/bash

source ./get_info.sh
source ./colors.sh
source ./config.conf

p1=${column1_background:-1}  
p2=${column1_font_color:-5}  
p3=${column2_background:-1}   
p4=${column2_font_color:-2}   

load_color "$p1" "$p2" "$p3" "$p4"

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

cbg1=$([[ -z "$column1_background" ]] && echo "default (white)" || echo "$p1 (${name[$p1]})")
cfc1=$([[ -z "$column1_font_color" ]] && echo "default (purple)" || echo "$p2 (${name[$p2]})")
cbg2=$([[ -z "$column2_background" ]] && echo "default (white)" || echo "$p3 (${name[$p3]})")
cfc2=$([[ -z "$column2_font_color" ]] && echo "default (red)" || echo "$p4 (${name[$p4]})")

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
echo ""
echo "Column 1 background = $cbg1"
echo "Column 1 font color = $cfc1"
echo "Column 2 background = $cbg2"
echo "Column 2 font color = $cfc2"