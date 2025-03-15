#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Ошибка: Не указаны файлы."
    exit 1
fi

for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "$file => not found"
    else
        line_count=$(wc -l < "$file")
        echo "$file => $line_count"
    fi
done
