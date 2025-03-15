#!/bin/bash

if [ -z "$1" ]; then
    echo "Ошибка: Не указан путь."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Ошибка: Путь '$1' не существует."
    exit 1
fi

target_dir=${2:-.}

for dir in "$1"/*/; do
    if [ -d "$dir" ]; then
        dir_name=$(basename "$dir")
        count=$(ls -1A "$dir" | wc -l)
        echo "$count" > "$target_dir/$dir_name"
    fi
done

echo "Скрипт успешно завершен."
