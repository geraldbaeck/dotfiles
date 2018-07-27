#!/usr/bin/env bash

function md {
  if [ ! -z "$1" ]; then
    mkdir $1
    echo "created ./${1}/"
  else
    echo "You derped and didn't give a directory name. "
    echo "Since I'm a better program than you are a programmer, I'll just go ahead and ask you. "
    echo "What the fuck directory do you want me to create?"
    read dir_name
    mkdir $dir_name
    echo "created ./${dir_name}/"
  fi
}

function getdns {
    networksetup -getdnsservers Wi-Fi
}

function setdns {
    dns_services=(empty cloudflare freedns google opendns yandex)
    cloudflare="1.1.1.1"
    freedns="37.235.1.174 37.235.1.177"
    google="8.8.8.8 8.8.4.4"
    opendns="208.67.222.222 208.67.220.220"
    yandex="77.88.8.8 77.88.8.1"
    empty="empty"
    if [ ! -z "$1" ]; then
        for i in ${dns_services[@]}; do
            if [ "$i" == "${1,,}" ]; then
                dns_address=$(eval "echo \${${1,,}}")
                networksetup -setdnsservers Wi-Fi $dns_address
                echo "DNS Server set to ${1~} (${dns_address})"
            fi
        done
    else
        dns_services_real=(${dns_services[@]:1})
        selected_dns=${dns_services_real[$RANDOM % ${#dns_services_real[@]}]}
        echo $selected_dns
    fi
}
