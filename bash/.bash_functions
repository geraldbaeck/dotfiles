#!/usr/bin/env bash

# who am I
printf 'Running %s\n' "$BASH_SOURCE"

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
