#!/bin/bash

get_hostname() {
    echo $(hostname)
}

get_timezone() {
    echo $(timedatectl | grep "Time zone" | awk '{print $3, $4, $5}')
}

get_user() {
    echo $(whoami)
}

get_os() {
    echo $(awk -F= '/PRETTY_NAME/ {print $2}' /etc/os-release | tr -d '"')
}

get_date() {
    echo $(date +"%d %b %Y %H:%M:%S")
}

get_uptime() {
    echo $(uptime | awk '{print $3}' | tr -d ',')
}

get_uptime_sec() {
    echo $(awk '{print $1}' /proc/uptime)
}

get_ip() {
    echo $(hostname -I | awk '{print $1}')
}

get_mask() {
    echo $(netstat -rn | awk 'NR>2 && $3 ~ /[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/ {if ($3 != "0.0.0.0") {print $3; exit}}')
}

get_gateway() {
    echo $(ip route show | awk '/default/ {print $3}')
}

get_ram_total() {
    echo $(free -m | awk '/Mem:/ {printf "%.3f", $2/1024}')
}

get_ram_used() {
    echo $(free -m | awk '/Mem:/ {printf "%.3f", $3/1024}')
}

get_ram_free() {
    echo $(free -m | awk '/Mem:/ {printf "%.3f", $4/1024}')
}

get_space_root() {
    echo $(df / --output=size | awk 'NR==2 {printf "%.2f", $1}')
}

get_space_root_used() {
    echo $(df / --output=used | awk 'NR==2 {printf "%.2f", $1}')
}

get_space_root_free() {
    echo $(df / --output=avail | awk 'NR==2 {printf "%.2f", $1}')
}