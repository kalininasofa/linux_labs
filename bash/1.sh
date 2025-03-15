#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Использование: $0 <имя_файла> <длительность_в_секундах>"
    exit 1
fi

output_file=$1
duration=$2

start_time=$(date +%s)

while [ $(($(date +%s) - start_time)) -lt $duration ]; do
    current_time=$(date +"%d.%m.%y %H:%M")
    
    load_avg=$(cat /proc/loadavg)
    
    echo "$current_time = $load_avg" >> "$output_file"
    
    sleep 1
done

echo "Данные сохранены в $output_file"
