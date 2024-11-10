#!/bin/bash

ram=$(grep MemTotal /proc/meminfo | awk '{printf "%.2f GB", $2 / 1024 / 1024}')
gpu=$(lspci | grep -i 'vga\|3d' | grep -i 'nvidia\|amd\|intel' | head -n 1 | sed -E 's/.*: (.*)/\1/' | tr -d '\n\r')
cpu=$(grep 'model name' /proc/cpuinfo | uniq | awk -F ': ' '{print $2}' | sed 's/ @.*//' | tr -d '\n\r')

os=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')
de=$(echo $DESKTOP_SESSION | sed -e 's/.*/\L&/; s/[a-z]/\u&/')

up=$(uptime -p | awk '{print $2}')

time=$(date '+%H:%M')
day=$(LC_TIME=en_US.UTF-8 date '+%A')

user=$(whoami)
name=$(echo $user | awk '{print toupper(substr($0, 1, 1)) tolower(substr($0, 2))}')

CYAN='\e[36m'
RESET='\e[0m'

# PRINT

echo""
printf " ${CYAN}${RESET} • Hey ${CYAN}%s${RESET}!\n" "$name"
printf " ${CYAN}󰔚${RESET} • It's now ${CYAN}%s${RESET}.\n" "$time"
printf " ${CYAN}󱑎${RESET} • It's ${CYAN}%s${RESET} today.\n" "$day"
echo""
printf " ${CYAN}${RESET} • I can't believe it, mate, you actually have ${CYAN}%s${RESET} of RAM in your computer! That's really unbelievable.\n" "$ram"
printf " ${CYAN}${RESET} • Oh! Oh! No no, this can't be real! You have a ${CYAN}%s${RESET}? Oh, my God!\n" "$gpu"
printf " ${CYAN}${RESET} • I understand your processor is an ${CYAN}%s${RESET}. That's really cool!\n" "$cpu"
echo""
printf " ${CYAN}${RESET} • You're running ${CYAN}%s${RESET} as your operating system. It's definitely better than Windows. Haha.\n" "$os"
printf " ${CYAN}󰔃${RESET} • Come on, mate! You didn't tell me you were using the ${CYAN}%s${RESET} desktop environment.\n" "$de"
echo""
printf " ${CYAN}${RESET} • Seriously? You've been on the computer for ${CYAN}%s${RESET} hours? Go touch some grass, mate.\n" "$up"
echo""
