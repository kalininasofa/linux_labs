#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Unknown planet"
    exit 1

declare -A planets=(
    ["Mercury"]=0
    ["Venus"]=0
    ["Earth"]=1
    ["Mars"]=2
    ["Jupiter"]=98
    ["Saturn"]=83
    ["Uranus"]=27
    ["Neptune"]=14
)

planet="$1"

if [[ -z "${planets[$planet]}" ]]; then
    echo "Unknown planet"
else
    echo "${planets[$planet]}"
fi
