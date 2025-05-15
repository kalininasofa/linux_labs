#!/bin/bash

OLD_IFS="$IFS"
IFS=':'

count_files() {
    local dir="$1"
    local count=0
    
    if [ -d "$dir" ] && [ ! -L "$dir" ]; then
        count=$(find "$dir" -maxdepth 1 -type f 2>/dev/null | wc -l)
    else
        
        return 1
    fi
    
    echo "$count"
}


for dir in $PATH; do
    dir="${dir%/}"  
    count=$(count_files "$dir")
   
    if [ $? -eq 0 ]; then
        echo "$dir => $count"
    fi
done


IFS="$OLD_IFS"
