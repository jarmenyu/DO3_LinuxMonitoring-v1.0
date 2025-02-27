#!/bin/bash

start_time=$(date +%s)

if [ $# -ne 1 ]; then
    echo "Enter only 1 parameter"
    exit 1
elif [[ $1 =~ [0-9] ]]; then
    echo "Enter without digits"
    exit 1
elif [[ ! $1 =~ /$ ]]; then
    echo "Parameter must end with /"
    exit 1
elif [[ ! -d "$1" ]]; then
    echo "Error: Directory does not exist!"
    exit 1
fi

dir="$1"

amount_dirs=$(find $1 -type d 2>/dev/null | wc -l)
top_dirs=$(du -h $1 --max-depth=1 2>/dev/null | sort -rh | tail -n +2 | head -n 5 | awk '{print NR " - " $2 ", " $1}')
amount_files=$(find $1 -type f 2>/dev/null | wc -l)
amount_conf=$(find $1 -type f -name "*.conf" 2>/dev/null | wc -l)
amount_text_files=$(find $1 -type f -exec file {} + 2>/dev/null | grep "ASCII text" | wc -l)
amount_exec=$(find $1 -type f -executable 2>/dev/null | wc -l)
amount_logs=$(find $1 -type f -name "*.log" 2>/dev/null | wc -l)
amount_archives=$(find "$1" -type f \( -name "*.tar" -o -name "*.gz" -o -name "*.zip" -o -name "*.rar" \) 2>/dev/null | wc -l)
amount_links=$(find "$1" -type l 2>/dev/null | wc -l)
top_files=$(find $1 -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 10 | awk '{print $1, $2}' | while read -r size path; do
    type=$(file -b "$path" | awk -F', ' '{print $1}')
    echo "$((++i)) - $path, $size, $type"
done)
top_exec=$(find $1 -type f -executable -exec du -h {} + 2>/dev/null | sort -rh | head -n 10 | awk '{print $1, $2}' | while read -r size path; do 
    hash=$(md5sum "$path" 2>/dev/null | awk '{print $1}');     echo "$((++i)) - $path, $size, $hash";
done)

echo "Total number of folders (including all nested ones) = $amount_dirs"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$top_dirs"
echo "Total number of files = $amount_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $amount_conf"
echo "Text files = $amount_text_files"
echo "Executable files = $amount_exec"
echo "Log files (with the extension .log) = $amount_logs"
echo "Archive files = $amount_archives"
echo "Symbolic links = $amount_links"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$top_files"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$top_exec"

end_time=$(date +%s)
execution_time=$((end_time - start_time))

echo "Script execution time (in seconds) = $execution_time"
