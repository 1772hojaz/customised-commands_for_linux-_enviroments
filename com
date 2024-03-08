#!/bin/bash

red='\033[31m'
green='\033[0;32m'
reset_color='\033[0m'

echo "Enter the file name:"
read -r P

if [ -z "$P" ]; then
    echo "${red}No file name provided.${reset_color}"
    exit 1
fi

gcc -Wall -pedantic -Werror -Wextra -std=gnu89 "$P"

if [ $? -ne 0 ]; then
    echo -e "${red}Compilation failed.${reset_color}"
else
    echo -e "${green}Compilation successful.${reset_color}"
fi
