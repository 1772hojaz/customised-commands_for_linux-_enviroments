#!/bin/bash

red='\033[31m'
green='\033[0;32m'
reset_color='\033[0m'

P=$1

R=$2

if [ -z "$P" ]; then
    echo -e "${red}No file name provided.${reset_color}"
    exit 1
fi

gcc -Wall -pedantic -Werror -Wextra -std=gnu89 "$P" -o "$R"

if [ $? -ne 0 ]; then
    echo -e "${red}Compilation failed.${reset_color}"
else
    echo -e "${green}Compilation successful.${reset_color}"
fi
