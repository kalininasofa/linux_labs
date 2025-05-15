#!/bin/bash
set -eo pipefail  

if [[ "${FOO:-}" == "5" && "${BAR:-}" == "1" ]]; then
    echo "Выполнение запрещено: FOO=5 и BAR=1." >&2
    exit 1
fi


if [[ -f "fix.txt" ]]; then
    echo "Обнаружен файл: fix.txt"
    exit 0
fi

if [[ -n "${CI:-}" ]]; then
   
    sleep 1.5  
    exit 0
else
    
    echo "Мониторим текущий каталог. Ожидаем новый файл..."
    while true; do
        if [[ -f "fix.txt" ]]; then
            echo "Обнаружен файл: fix.txt"
            exit 0
        fi
        sleep 0.5  
    done
fi
