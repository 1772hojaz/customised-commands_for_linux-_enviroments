#!/bin/bash

red='\033[31m'
green='\033[0;32m'
reset_color='\033[0m'


if [ -z "$1" ]; then
    echo -e "${red}No file name provided.${reset_color}"
    exit 1
fi
if [ $# -ge 2 ];then
	gcc -Wall -pedantic -Werror -Wextra -std=gnu89 "$1" -o "$2"
else
	gcc -Wall -pedantic -Werror -Wextra -std=gnu89 "$3" "$4" "$1" -o "$2"
	if [ $? -ne 0 ]; then
		echo -e "${red}Compilation failed.${reset_color}"
	else
		echo -e "${green}Compilation successful.${reset_color}"
	fi
fi
