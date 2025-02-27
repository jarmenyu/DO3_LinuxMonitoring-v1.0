#!/bin/bash

save_to_file() {
    filename=$(date +"%d_%m_%y_%H_%M_%S").txt
    echo "HOSTNAME = $HOSTNAME" > "$filename"
    echo "TIMEZONE = $TIMEZONE" >> "$filename"
    echo "USER = $USER" >> "$filename"
    echo "OS = $OS" >> "$filename"
    echo "DATE = $DATE" >> "$filename"
    echo "UPTIME = $UPTIME" >> "$filename"
    echo "UPTIME_SEC = $UPTIME_SEC" >> "$filename"
    echo "IP = $IP" >> "$filename"
    echo "MASK = $MASK" >> "$filename"
    echo "GATEWAY = $GATEWAY" >> "$filename"
    echo "RAM_TOTAL = $RAM_TOTAL Gb" >> "$filename"
    echo "RAM_USED = $RAM_USED Gb" >> "$filename"
    echo "RAM_FREE = $RAM_FREE Gb" >> "$filename"
    echo "SPACE_ROOT = $SPACE_ROOT Mb" >> "$filename"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED Mb" >> "$filename"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE Mb" >> "$filename"
}

ask_to_save() {
    while true; do 
        echo "Do you want write these data into a file? Answer Y/N"
        read decision

        if [ "$decision" = 'Y' ] || [ "$decision" = 'y' ]; then
            save_to_file
            exit 0
        elif [ "$decision" = 'N' ] || [ "$decision" = 'n' ]; then
            echo "Data not saved"
            exit 0
        else 
            echo "Incorrect answer, write Y - yes or N - no"
        fi
    done
}